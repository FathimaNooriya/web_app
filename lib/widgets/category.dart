import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .85,
        height: MediaQuery.of(context).size.height * .85,
        child: StreamBuilder(
          initialData: const Text("Data Loading"),
          stream: FirebaseFirestore.instance.collection("Service").snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    // childAspectRatio: 2 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                              "${snapshot.data.docs[index]["Service Category Name"]}"),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 150,
                              width: 200,
                              color: Colors.blueGrey,
                              child: Image.network(
                                snapshot.data.docs[index]["ImageUrl"]
                                    .toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(error.toString());
                                },
                              ),
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Hourly Rate"),
                              Text(
                                  "${snapshot.data.docs[index]["HourlyRate"]}"),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Issue:"),
                              Text("${snapshot.data.docs[index]["Issues"]}"),
                              // ListView.builder(
                              //     itemCount: 3,
                              //     itemBuilder: ((context, index) {
                              //       return Text("data");
                              //     }))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
