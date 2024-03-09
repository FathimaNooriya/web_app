import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/service_model.dart';

class UploadData {
  // Future<String> uploadImage(String childName, String file) async {
  //   debugPrint("wwwwwwwwwwwwwwww");
  //   Reference refnc = FirebaseStorage.instance.ref("name/$childName");
  //   debugPrint("wwwwwweeeeeeeeeeeewwwwwwwwww");
  //   UploadTask uploadTask = refnc.putData(file);0
  //   debugPrint("wwwwwwwwwwrrrrrrrrrrrrrrrwwwwww");
  //   TaskSnapshot snapshot = await uploadTask;
  //   debugPrint("wwwwwwwtttttttttttwwwwwwwww");
  //   String downloadUrl = await snapshot.ref.getDownloadURL();
  //   debugPrint("wwwwwwwwwyyyyyyyyyyyyyyywwwwwww");
  //   return downloadUrl;
  // }

  // Future<String> saveImage(
  //     {required String name,
  //     required String bio,
  //     required String file}) async {
  //   debugPrint("qqqqqqqqqqqqqqqqq");
  //   try {
  //     String imageUrl = await uploadImage(name, file);
  //     await FirebaseFirestore.instance.collection("Service category").add({
  //       "name": name,
  //       "bio": bio,
  //       "imageLink": imageUrl,
  //     });
  //     debugPrint("wwwwwwwwwuuuuuuuuuuuwwwwwww");
  //     return "Success";
  //   } catch (e) {
  //     return "Some thing went wrong";
  //   }
  // }

  // Future<firebase_storage.ListResult> listImages() async {
  //   firebase_storage.ListResult results =
  //       await firebase_storage.FirebaseStorage.instance.ref("name").listAll();
  //   for (var ref in results.items) {
  //     debugPrint("Found file: $ref");
  //   }
  //   return results;
  // }

  // Future<String> dowmloadUrl(String imageName) async {
  //   String imageUrl = await firebase_storage.FirebaseStorage.instance
  //       .ref("name/$imageName")
  //       .getDownloadURL();
  //   final imageResponce = await NetworkAssetBundle(Uri.parse(imageUrl));
  //   return imageUrl;
  // }

  // Future<String> uploadImage2({required XFile img}) async {
  //   String url = '';
  //   File imgFile = File(img.path);
  //   String imageName = imgFile.path.split('/').last.toString();
  //   Reference toRoot = FirebaseStorage.instance.ref();
  //   Reference toDirectory = toRoot.child('categoryImage');
  //   Reference toImage = toDirectory.child('Images/$imageName');
  //   try {
  //     await toImage.putFile(imgFile);
  //     url = await toImage.getDownloadURL();
  //   } catch (e) {
  //     print(e);
  //   }
  //   return url;
  // }

  // Future<Uint8List> imgUrl(String imageName) async {
  //   String imageUrl = await firebase_storage.FirebaseStorage.instance
  //       .ref("name/$imageName")
  //       .getDownloadURL();
  //   final imageResponce = await NetworkAssetBundle(Uri.parse(imageUrl));
  //   Uint8List imageBytes = Uint8List.fromList(imageResponce as List<int>);

  //   return imageBytes;
  // }

  Future<String> uploadImage2(
      {required Uint8List img,
      required String selectFile,
      required String serviceName,
      required String ctegoryName,
      required String issue,
      required double hourlyRate}) async {
    String imageUrl = '';

    //  String imageName = imgFile.path.split('/').last.toString();
    // Reference toRoot = FirebaseStorage.instance.ref();
    // Reference toDirectory = toRoot.child('categoryImage');
    //  Reference toImage = toDirectory.child('Images/$imageName');
    try {
      final metaData =
          firebase_storage.SettableMetadata(contentType: "image/png");
      //  firebase_storage.SettableMetadata(contentType: "file/pdf");

      final uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child("Service")
          .child("/" + selectFile)
          .putData(img, metaData);
      //await uploadTask.whenComplete(()=>null);
      imageUrl = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child("Service")
          .child("/$selectFile")
          .getDownloadURL();
      debugPrint(uploadTask.toString());
      debugPrint("Uploded Image$imageUrl");
      print("258258258......................................................");
      FirebaseFirestore.instance.collection("Service").add({
        "Service Name": serviceName,
        "Service Category Name": ctegoryName,
        "ImageUrl": imageUrl,
        "ImageName": selectFile,
        "Issues": issue,
        "HourlyRate": hourlyRate
      });

      //  await toImage.putFile(imgFile);
      //  url = await toImage.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageUrl;
  }

  Future<Uint8List> imgUrl(String imageName) async {
    String imageUrl = await firebase_storage.FirebaseStorage.instance
        .ref("name/$imageName")
        .getDownloadURL();
    final imageResponce = NetworkAssetBundle(Uri.parse(imageUrl));
    Uint8List imageBytes = Uint8List.fromList(imageResponce as List<int>);

    return imageBytes;
  }
}

class UploadServiceData {
  Future<String> uploadService(
      {required String serviceName,
      required Uint8List serviceImage,

      // required ServiceModel serviceModel,
      required String file}) async {
    String serviceImageUrl = '';
    //Uint8List serviceImg = serviceModel.serviceImage;
    //  String imageName = imgFile.path.split('/').last.toString();
    // Reference toRoot = FirebaseStorage.instance.ref();
    // Reference toDirectory = toRoot.child('categoryImage');
    //  Reference toImage = toDirectory.child('Images/$imageName');
    try {
      final metaData =
          firebase_storage.SettableMetadata(contentType: "image/png");
      print("1111111111111111");
      final uploadService = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child("Service")
          .child("/" + file)
          .putData(serviceImage, metaData);
      print("2222222222222222222");
      //await uploadTask.whenComplete(()=>null);
      serviceImageUrl = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child("Service")
          .child("/$file")
          .getDownloadURL();
      print("333333333333333");
      debugPrint(uploadService.toString());
      debugPrint("Uploded Image$serviceImageUrl");

      FirebaseFirestore.instance.collection("Service").add({
        "Service Name": serviceName,
        "Service Image": serviceImageUrl,
        // "Service Name": serviceName,
        // "Service Category Name": ctegoryName,
        // "ImageUrl": imageUrl,
        // "ImageName": selectFile,
        // "Issues": issue,
        // "HourlyRate": hourlyRate
      });
      print("444444444444");
      //  await toImage.putFile(imgFile);
      //  url = await toImage.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    }
    return serviceImageUrl;
  }

  // Future<Uint8List> imgUrl(String imageName) async {
  //   String imageUrl = await firebase_storage.FirebaseStorage.instance
  //       .ref("name/$imageName")
  //       .getDownloadURL();
  //   final imageResponce =  NetworkAssetBundle(Uri.parse(imageUrl));
  //   Uint8List imageBytes = Uint8List.fromList(imageResponce as List<int>);

  //   return imageBytes;
  // }
}

//ServiceModel
