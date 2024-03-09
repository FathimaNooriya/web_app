import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webapp/upload_data/login_repository.dart';
import 'package:webapp/upload_data/registration_repository.dart';
import 'package:webapp/upload_data/upload_data_repository.dart';
import '../../models/service_model.dart';
import '../../upload_data/image_picker.dart';
import '../../models/login_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController serviceHourlyRateController =
      TextEditingController();
  final TextEditingController categoryHourlyRateController =
      TextEditingController();
  final TextEditingController serviceAddIssueController =
      TextEditingController();
  final TextEditingController categoryAddIssueController =
      TextEditingController();
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController loginPhoneNoController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final GlobalKey<FormState> sigupInKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();
  final GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  Uint8List myImage = Uint8List.fromList([0, 1, 2, 3, 4]);
  String selectedImage = " ";
  AuthCubit() : super(AuthInitial());

  Future<void> registration({signUpEmail, signUpPassword, context}) async {
    emit(AuthLoading());
    final result = await SignUpRepo.signUpFn(
        signUp: LoginModel(email: signUpEmail, password: signUpPassword),
        context: context);
    result.contains('Registration Successful')
        ? {
            emit(AuthSuccess(authResults: result)),
          }
        : emit(AuthError(authResults: result));
  }

  Future<void> login({loginEmail, loginPassword, context}) async {
    emit(AuthLoading());

    final result = await LoginRepository.login(
        loginModel: LoginModel(
          email: loginEmail,
          password: loginPassword,
        ),
        context: context);
    result.contains('You are Logged in')
        ? {
            emit(AuthSuccess(authResults: result)),
            loginEmailController.clear(),
            loginPasswordController.clear(),
          }
        : emit(AuthError(authResults: result));
  }

  Future<Uint8List?> selectCategoryImage() async {
    //  debugPrint("111");
    emit(ImageLoading());

    FilePickerResult? selectedFile =
        await pickMyImage(imgSource: ImageSource.gallery);
    Uint8List? selectedImageBytes = selectedFile!.files.first.bytes;
    selectedImage = selectedFile.files.first.name;
    //PlatformFile? myFile = await pickMyImage(imgSource: ImageSource.gallery);
    // XFile? selectedImage = await pickMyImage(imgSource: ImageSource.gallery);
    // String? selectedImage = await pickMyImage(imgSource: ImageSource.gallery);
    // debugPrint("SSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    //  myImage.clear();
    //  myImage = selectedImage;
    if (selectedImageBytes != null) {
      // debugPrint(selectedImage.toString());
      emit(
          ImageSelected(myFile: selectedImageBytes, myFileName: selectedImage));

      return selectedImageBytes;
    } else {
      emit(ImageNotSelected());
    }
    return null;
  }

  Future<void> uploadCategoryImage({
    required String bio,
    required Uint8List file,
    required String ctegoryName,
    required String issue,
    required String serviceName,
    required double hourlyRate,
  }) async {
    emit(CategoryUploading());
    debugPrint("ssssssssssssssssssss");
    String result = await UploadData().uploadImage2(
        img: file,
        selectFile: bio,
        serviceName: serviceName,
        ctegoryName: ctegoryName,
        issue: issue,
        hourlyRate: hourlyRate);
    if (result.isNotEmpty) {
      emit(CategoryUploaded(myFile: file));
    } else {
      emit(CategoryNotUploaded());
    }
  }

  Future<void> serviceDataUpload({
    required Uint8List file,
    required String serviceName,
  }) async {
    emit(ServiceUploading());
    debugPrint("ssssssssssssssssssss");
    String result = await UploadServiceData().uploadService(
        // serviceModel: ServiceModel(
        //   serviceName: serviceName,
        //   serviceImage: file,
        // ),
        serviceImage: file,
        serviceName: serviceName,
        file: selectedImage);
    if (result.isNotEmpty) {
      emit(ServiceUploaded(myFile: file));
    } else {
      emit(ServiceNotUploaded());
    }
  }

  //  loadata() async {
  //   int loadData = await FirebaseFirestore.instance
  //       .collection("Service")
  //       .snapshots()
  //       .length;
  //   emit(LoadedData());

  // }

  // Future<Uint8List?> selectServiveImage() async {
  //   //  debugPrint("111");
  //   emit(ImageLoading());

  //   FilePickerResult? selectedFile =
  //       await pickMyImage(imgSource: ImageSource.gallery);
  //   Uint8List? selectedImageBytes = selectedFile!.files.first.bytes;
  //   selectedImage = selectedFile.files.first.name;
  //   if (selectedImageBytes != null) {
  //     // debugPrint(selectedImage.toString());
  //     emit(
  //         ImageSelected(myFile: selectedImageBytes, myFileName: selectedImage));

  //     return selectedImageBytes;
  //   } else {
  //     emit(ImageNotSelected());
  //   }
  //   return null;
  // }
}
