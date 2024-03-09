import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<FilePickerResult?> pickMyImage({required ImageSource imgSource}) async {
  // final ImagePicker pickedImage = ImagePicker();

  //Uint8List selectedImageInBytes;

  FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();

  if (filePickerResult != null) {
   // selectedImageInBytes = filePickerResult.files.first.bytes!;
    return filePickerResult;
  } else {
    debugPrint("No image selected");
  }
  return null;

//...........................................................
  // XFile? file = await ImagePicker().pickImage(source: imgSource);
  // if (file != null) {
  //   return file;
  // } else {
  //   debugPrint("No image selected");
  // }
  // return null;
//....................................................

  // final result = await FilePicker.platform.pickFiles();
  // PlatformFile? picked1File = result!.files.first;
  // return picked1File;

  // XFile? imagePic;
  // try {
  //   imagePic = await ImagePicker().pickImage(source: imgSource);
  // } catch (e) {
  //   print(".......................");
  //   print(e.toString());
  //   return null;
  // }
  //return imagePic;
}
