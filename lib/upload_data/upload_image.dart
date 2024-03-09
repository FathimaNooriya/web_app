import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToFireStore(
      String serviceName, Uint8List file) async {
    Reference ref = _storage.ref().child(serviceName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required String serviceName,
      required double ratePerHr,
      required String issue,
      required Uint8List file}) async {
    String resp = "Some Error Occurred";
    try {
      String imageUrl = await uploadImageToFireStore("serviceName", file);
      await _firestore.collection("Service").add({
        "Service Name": serviceName,
        "PerHourRate": ratePerHr,
        "ServiceIssue": issue,
        "ServiceImage": file,
      });
      resp = "Success";
      return imageUrl;
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
