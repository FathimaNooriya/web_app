part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  bool isloading = true;
}

class AuthSuccess extends AuthState {
  bool isloading = false;
  final String authResults;

  AuthSuccess({required this.authResults});
}

class AuthError extends AuthState {
  bool isloading = false;
  final String authResults;
  AuthError({required this.authResults});
}

class ImageSelected extends AuthState {
  Uint8List myFile;
  String myFileName;
  ImageSelected({required this.myFile, required this.myFileName});
}

class ImageNotSelected extends AuthState {
  ImageNotSelected();
}

class ImageLoading extends AuthState {
  ImageLoading();
}

class CategoryUploading extends AuthState {
  CategoryUploading();
}

class CategoryUploaded extends AuthState {
  Uint8List? myFile;
  CategoryUploaded({required this.myFile});
}

class CategoryNotUploaded extends AuthState {
  CategoryNotUploaded();
}
class ServiceUploading extends AuthState {
  ServiceUploading();
}

class ServiceUploaded extends AuthState {
  Uint8List? myFile;
  ServiceUploaded({required this.myFile});
}

class ServiceNotUploaded extends AuthState {
  ServiceNotUploaded();
}

// class LoadedData extends AuthState {
//   LoadedData();
// }
