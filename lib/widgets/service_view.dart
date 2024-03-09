import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({
    super.key,
    required this.serviceName,
    this.serviceImage,
    // required this.lenthdata,
  });
  final String serviceName;
  final serviceImage;
  //final int lenthdata;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<ServiceView> {
  // CollectionReference reference1 =
  //     FirebaseFirestore.instance.collection('collectionPath');
// late Stream<QuerySnapshot> StreamImage;
//Stream<QuerySnapshot> StreamImage = reference1.snapshots();
  //var list1 = FirebaseFirestore.instance.collection("Service").snapshots();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
          child: Text(
            widget.serviceName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 150,
            width: 200,
            color: Colors.deepPurple,
          ),
          const Text("Category"),
          SizedBox(
            height: 250,
            width: 500,
            child: StreamBuilder(
              initialData: const Text("Data Loading"),
              stream:
                  FirebaseFirestore.instance.collection("Service").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      //  Future.delayed(const Duration(milliseconds: 500));

                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                    "${snapshot.data.docs[index]["Service Name"]}"),
                                Text(
                                    "${snapshot.data.docs[index]["Service Category Name"]}"),
                                Text("${snapshot.data.docs[index]["Issues"]}"),
                                Text(
                                    "${snapshot.data.docs[index]["HourlyRate"]}"),
                              ],
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.cyan,
                              child: Image.network(
                                snapshot.data.docs[index]["ImageUrl"]
                                    .toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(error.toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ])),
        actions: [
          CupertinoButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ]);
  }
}
