import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/logic/cubit/auth_cubit.dart';
import 'package:webapp/widgets/test_image.dart';
import 'package:webapp/widgets/textfield_and_tittle.dart';

class Service_ScreenNot extends StatelessWidget {
  const Service_ScreenNot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .85,
        height: MediaQuery.of(context).size.height * .85,
        child: Form(
          key: context.read<AuthCubit>().serviceKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50, top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            Text("Services", style: ColorAndFont.TITTLE_TEXT),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirestoreExample()));
                        },
                        child: const Text("llllll")),
                    ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context, builder: (_) => const MyDialog());
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add Service"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.5 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: 30,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              color: Colors.amber,
                            ),
                          ),
                          const Text("Plumbing"),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  CollectionReference reference1 =
      FirebaseFirestore.instance.collection('collectionPath');
// late Stream<QuerySnapshot> StreamImage;
//Stream<QuerySnapshot> StreamImage = reference1.snapshots();
  List<int> list1 = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Center(
          child: Text(
            "Add Service",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 140,
                    color: Colors.deepPurple,
                  ),
                  Column(
                    children: [
                      // const Text("Service"),
                      SizedBox(
                        width: 300,
                        child: TextFirmFieldWithTitle(
                            textFeildTittle: "Service",
                            myController:
                                context.read<AuthCubit>().serviceNameController,
                            validatorFunction: () {
                              String hourlyRate = context
                                  .read<AuthCubit>()
                                  .serviceNameController
                                  .text;
                              if (hourlyRate == "") {
                                return "Enter a Valid Service Name";
                              }
                              return null;
                            }),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10))),
                        // ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Service Category",
                        style: ColorAndFont.SM_TEXT,
                      ),
                      IconButton(
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (_) => const MyCategoryAlert());
                            //AddServiceScerren(con: context));
                            list1.add(1);
                            setState(() {});
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
              ),
              list1.isNotEmpty
                  ? SizedBox(
                      height: 250,
                      width: 500,
                      //child:
                      //  FutureBuilder(
                      //     future: UploadData().dowmloadUrl(context
                      //         .read<AuthCubit>()
                      //         .categoryNameController
                      //         .text),
                      //     builder:
                      //         (context, AsyncSnapshot<String> imageSnapshort) {
                      //       if (imageSnapshort.connectionState ==
                      //               ConnectionState.done &&
                      //           imageSnapshort.hasData) {
                      //     return
                      //   Container(
                      // height: 50,
                      // width: 50,
                      // color: Colors.amber,

                      // child: FutureBuilder(
                      //     future: download1(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasError) {
                      //         return Text("Some Error");
                      //       } else {
                      //         if (snapshot.connectionState ==
                      //             ConnectionState.done) {
                      //           return Image.network(snapshot.data.toString());
                      //         }
                      //       }
                      //       return CircularProgressIndicator();
                      //     }),

                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Service")
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                Future.delayed(
                                    const Duration(milliseconds: 500));
                                print(".......................imgurl.........");
                                print(
                                  snapshot.data.docs[index]["ImageUrl"]
                                      .toString(),
                                );
                                return Row(
                                  children: [
                                    //ListTile(
                                    //   title:
                                    Text(
                                        "${snapshot.data.docs[index]["Service Name"]}"),
                                    // subtitle:
                                    Text(
                                        "${snapshot.data.docs[index]["Service Category Name"]}"),

                                    //  leading:
                                    Container(
                                      height: 80,
                                      width: 80,
                                      color: Colors.cyan,
                                      child: Image.network(
                                        snapshot.data.docs[index]["ImageUrl"]
                                            .toString(),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Text(error.toString());
                                        },
                                      ),
                                    ),
                                  ],
                                );
                                // Future<Uint8List> data1 = UploadData().imgUrl(
                                //     context
                                //         .read<AuthCubit>()
                                //         .categoryNameController
                                //         .text);

                                // print(imageSnapshort.data);
                              });
                        },
                      ),

                      // ),
                      // child: ListView.builder(
                      //   itemCount: 1,
                      //   itemBuilder: (context, index) {
                      //     Future<Uint8List> data1 = UploadData()
                      //         .imgUrl(context
                      //             .read<AuthCubit>()
                      //             .categoryNameController
                      //             .text);

                      //     print(imageSnapshort.data);

                      // return Column(
                      //   children: [
                      //     ElevatedButton(
                      //         onPressed: () async {
                      //           // bytes = (await NetworkAssetBundle(
                      //           //             Uri.parse(
                      //           //                 imageSnapshort
                      //           //                     .data!))
                      //           //         .load(
                      //           //             imageSnapshort.data!))
                      //           //     .buffer
                      //           //     .asUint8List();
                      //         },
                      //         child: Text("lll")),
                      //     Container(
                      //       child: Image(
                      //           image: MemoryImage(
                      //               data1 as Uint8List)),
                      //     )
                      //   ],
                      // );
                      // return Column(
                      //   children: [
                      //     Container(
                      //       child: Image(
                      //         // image: MemoryImage(imageSnapshort
                      //         //     .data as Uint8List),
                      //       ),
                      //     ),
                      //   ],
                      // );
                      //  },
                      //  ),
                      // );
                      // }
                      //   if (imageSnapshort.connectionState ==
                      //       ConnectionState.waiting) {
                      //     return CircularProgressIndicator();
                      //   }
                      //   return Container();
                      // }),

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: list1.length,
                      //     itemBuilder: (BuildContext context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceEvenly,
                      //           children: [
                      //             Container(
                      //               height: 80,
                      //               width: 100,
                      //               color: Colors.deepPurple,
                      //             ),
                      //             // Column(
                      //             //   children: [
                      //             Text(
                      //               "Service Category",
                      //               style: ColorAndFont.SM_TEXT,
                      //             ),
                      //             //     SizedBox(
                      //             //       width: 300,
                      //             //       child: TextFormField(
                      //             //         decoration: InputDecoration(
                      //             //             border: OutlineInputBorder(
                      //             //                 borderRadius:
                      //             //                     BorderRadius.circular(10))),
                      //             //       ),
                      //             //     ),
                      //             //   ],
                      //             // )
                      //           ],
                      //         ),
                      //       );
                      //     }),
                    )
                  : Column(
                      children: [
                        TextFirmFieldWithTitle(
                            textFeildTittle: "Add hourly rate",
                            myController: context
                                .read<AuthCubit>()
                                .serviceHourlyRateController,
                            validatorFunction: () {
                              String hourlyRate = context
                                  .read<AuthCubit>()
                                  .serviceHourlyRateController
                                  .text;
                              if (hourlyRate == "") {
                                return "Enter a valid hourly rate";
                              }
                              return null;
                            }),
                        TextFirmFieldWithTitle(
                            textFeildTittle: "Add Issue",
                            myController: context
                                .read<AuthCubit>()
                                .serviceAddIssueController,
                            validatorFunction: () {
                              String hourlyRate = context
                                  .read<AuthCubit>()
                                  .serviceAddIssueController
                                  .text;
                              if (hourlyRate == "") {
                                return "Please add Issue";
                              }
                              return null;
                            }),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 20),
                        //   child: Text("Add hourly rate"),
                        // ),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10))),
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.only(top: 20),
                        //   child: Text("Add Issue"),
                        // ),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10))),
                        // ),
                      ],
                    ),
            ],
          ),
        ),
        actions: [
          // Close the dialog
          // You can use the CupertinoDialogAction widget instead
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoButton(
                child: const Text('Save'),
                onPressed: () {
                  final bool val = context
                      .read<AuthCubit>()
                      .serviceKey
                      .currentState!
                      .validate();
                  if (val) {
                    // UploadServiceData().uploadService(serviceModel: ServiceModel(
                    //   serviceImage: ,
                    //   serviceName:context.read<AuthCubit>().serviceNameController.text,
                    // ));
                    debugPrint("////////////Correct///////////////");
                  } else {
                    debugPrint("////////////Not Correct///////////////");
                    return;
                  }

                  // Then close the dialog
                  //   Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ]);
  }
}

class MyCategoryAlert extends StatelessWidget {
  const MyCategoryAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List? categoryImage;
    //  List<TextEditingController> coltrillerList = [];
    return AlertDialog(
      title: const Text("Add Service Category"),
      content: SingleChildScrollView(
        child: SizedBox(
          height: 500,
          width: 450,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is ImageLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ImageSelected) {
                          debugPrint("ccccccccccccccc...........");
                          return InkWell(
                            child: Container(
                              height: 100,
                              width: 130,
                              color: const Color.fromARGB(255, 183, 58, 152),
                              child: Image.memory(categoryImage!),
                              //  child: Image.file(File(categoryImage!.path)),
                            ),
                            onTap: () async {
                              categoryImage = await context
                                  .read<AuthCubit>()
                                  .selectCategoryImage();
                            },
                          );
                        }
                        return GestureDetector(
                          child: Container(
                            height: 100,
                            width: 100,
                            color: const Color.fromARGB(255, 58, 183, 85),
                          ),
                          onTap: () async {
                            categoryImage = await context
                                .read<AuthCubit>()
                                .selectCategoryImage();
                          },
                        );
                      }),
                  SizedBox(
                    width: 290,
                    height: 150,
                    child: Form(
                      key: context.read<AuthCubit>().categoryKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //   Text("Service Category",),
                          SizedBox(
                            width: 300,
                            child: TextFirmFieldWithTitle(
                                textFeildTittle: "Service Category",
                                myController: context
                                    .read<AuthCubit>()
                                    .categoryNameController,
                                validatorFunction: () {
                                  String hourlyRate = context
                                      .read<AuthCubit>()
                                      .categoryNameController
                                      .text;
                                  if (hourlyRate == "") {
                                    return "Enter a Valid Category Name";
                                  }
                                  return null;
                                }),
                            //  TextFormField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10))),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextFirmFieldWithTitle(
                textFeildTittle: "Add hourly rate",
                myController:
                    context.read<AuthCubit>().categoryHourlyRateController,
                validatorFunction: () {
                  String hourlyRate = context
                      .read<AuthCubit>()
                      .categoryHourlyRateController
                      .text;
                  if (hourlyRate == "") {
                    return "Enter a valid hourly rate";
                  }
                  return null;
                }),
            TextFirmFieldWithTitle(
                textFeildTittle: "Add Issue",
                myController:
                    context.read<AuthCubit>().categoryAddIssueController,
                validatorFunction: () {
                  String hourlyRate =
                      context.read<AuthCubit>().categoryAddIssueController.text;
                  if (hourlyRate == "") {
                    return "Please add Issue";
                  }
                  return null;
                }),

            // const Padding(
            //   padding: EdgeInsets.only(top: 20),
            //   child: Text("Add hourly rate"),
            // ),
            // SizedBox(
            //   width: 400,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10))),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 20),
            //   child: Text("Add Issue"),
            // ),
            // SizedBox(
            //   width: 420,
            //   height: 100,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 380,
            //         child: TextFormField(
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10)),
            //           ),
            //         ),
            //       ),
            //       // IconButton(
            //       //   onPressed: () {
            //       //     coltrillerList.add(TextEditingController());
            //       //   },
            //       //   icon: Icon(Icons.add_circle),
            //       // ),
            //       // coltrillerList.isNotEmpty
            //       //     ? ListView.builder(
            //       //         itemCount: coltrillerList.length,
            //       //         itemBuilder: (BuildContext context, int index) {
            //       //           return SizedBox(
            //       //             width: 380,
            //       //             child: TextFormField(
            //       //               decoration: InputDecoration(
            //       //                 border: OutlineInputBorder(
            //       //                     borderRadius: BorderRadius.circular(10)),
            //       //               ),
            //       //             ),
            //       //           );
            //       //         })
            //       //     : SizedBox()
            //     ],
            //   ),
            // ),
          ]),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              //   OpenFile.open(categoryImage!.path);
            },
            child: const Text("File")),
        CupertinoButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            }),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CategoryUploading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryUploaded) {
              debugPrint("ccccccccccccccc...........");

              return const Text("Uploaded");
            }

            return CupertinoButton(
              child: const Text('Save Service'),
              onPressed: () {
                final bool val = context
                    .read<AuthCubit>()
                    .categoryKey
                    .currentState!
                    .validate();
                if (val) {
                  // debugPrint("////////////Correct///////////////");
                  // UploadData().uploadImage("aaa", file)
                  context.read<AuthCubit>().uploadCategoryImage(
                        bio: context.read<AuthCubit>().selectedImage,
                        file: categoryImage!,
                        ctegoryName: context
                            .read<AuthCubit>()
                            .categoryNameController
                            .text
                            .trim(),
                        issue: context
                            .read<AuthCubit>()
                            .categoryAddIssueController
                            .text
                            .trim(),
                        hourlyRate: double.parse(context
                            .read<AuthCubit>()
                            .categoryHourlyRateController
                            .text
                            .trim()),
                        serviceName: 'serviceName',
                      );
                } else {
                  debugPrint("////////////Not Correct///////////////");
                }

                // Do something

                // Then close the dialog
                //  Navigator.of(context).pop();
              },
            );
          },
        ),
      ],
    );
  }
}

Future<String> download1() async {
  final myimageUrl = await firebase_storage.FirebaseStorage.instance
      .ref()
      .child("NOORIYA.jpg")
      .getDownloadURL();
  return myimageUrl;
}
