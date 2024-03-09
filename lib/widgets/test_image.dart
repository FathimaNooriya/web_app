import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreExample extends StatefulWidget {
  const FirestoreExample({super.key});

  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final CollectionReference _imagesCollection =
      FirebaseFirestore.instance.collection('images');
  late Uint8List _fetchedImageBytes;

  @override
  void initState() {
    super.initState();
    _fetchedImageBytes = Uint8List(0); // Initialize with an empty Uint8List
  }

  Future<void> _addImageToFirestore(Uint8List imageBytes) async {
    try {
      // Add the Uint8List to Firestore
      await _imagesCollection.add({
        'imageBytes': imageBytes,
      });
      debugPrint('Image added to Firestore');
    } catch (e) {
      debugPrint('Error adding image to Firestore: $e');
    }
  }

  Future<void> _fetchImageFromFirestore() async {
    try {
      // Fetch the image from Firestore
      QuerySnapshot querySnapshot = await _imagesCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        // Assume we only have one document in the collection for simplicity
        var imageDocument = querySnapshot.docs.first;
        var imageData = imageDocument['imageBytes'];

        // Convert the fetched data to Uint8List
        setState(() {
          _fetchedImageBytes = Uint8List.fromList(imageData.cast<int>());
        });

        debugPrint('Image fetched from Firestore');
      } else {
        debugPrint('No image found in Firestore');
      }
    } catch (e) {
      debugPrint('Error fetching image from Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> mylist = [1, 2, 3, 4, 5];
    Uint8List pickedImageBytes = Uint8List.fromList(mylist);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _fetchedImageBytes.isNotEmpty
                ? Image.memory(_fetchedImageBytes)
                : const Text('No image fetched from Firestore'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  mylist = await _pickImage();
                },
                child: const Text('PickImage')),
            ElevatedButton(
              onPressed: () {
                // Replace 'your_image_bytes' with the actual Uint8List you want to add
                Uint8List yourImageBytes = Uint8List.fromList(pickedImageBytes);
                _addImageToFirestore(yourImageBytes);
              },
              child: const Text('Add Image to Firestore'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _fetchImageFromFirestore();
              },
              child: const Text('Fetch Image from Firestore'),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<int>> _pickImage() async {
    List<int> imageBytes = [1, 2, 3, 4, 5];
    Uint8List pickedImageBytes = Uint8List.fromList(imageBytes);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();

      pickedImageBytes = Uint8List.fromList(imageBytes);
    }
    return pickedImageBytes;
  }
}
