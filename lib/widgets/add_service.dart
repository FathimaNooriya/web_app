import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/logic/cubit/auth_cubit.dart';
import 'package:webapp/widgets/textfield_and_tittle.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<AddService> {
  Uint8List? serviceImage;
  // CollectionReference reference1 =
  //     FirebaseFirestore.instance.collection('collectionPath');
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
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: Image.memory(
                              serviceImage!,
                              fit: BoxFit.cover,
                            ),
                            //  child: Image.file(File(categoryImage!.path)),
                          ),
                          onTap: () async {
                            serviceImage = await context
                                .read<AuthCubit>()
                                .selectCategoryImage();
                          },
                        );
                      }
                      return GestureDetector(
                        child: Container(
                          height: 150,
                          width: 200,
                          color: const Color.fromARGB(255, 58, 183, 85),
                        ),
                        onTap: () async {
                          serviceImage = await context
                              .read<AuthCubit>()
                              .selectCategoryImage();
                        },
                      );
                    }),
                Form(
                  key: context.read<AuthCubit>().serviceKey,
                  child: Column(
                    children: [
                      // const Text("Service"),
                      SizedBox(
                        width: 500,
                        child: TextFirmFieldWithTitle(
                            textFeildTittle: "Service",
                            myController:
                                context.read<AuthCubit>().serviceNameController,
                            validatorFunction: () {
                              String serviceName = context
                                  .read<AuthCubit>()
                                  .serviceNameController
                                  .text;
                              if (serviceName == "") {
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
                  ),
                )
              ],
            ),
          ]),
        ),
        //   list1.isNotEmpty
        //       ? SizedBox(
        //           height: 250,
        //           width: 500,
        //           child: StreamBuilder(
        //             stream: FirebaseFirestore.instance
        //                 .collection("Service")
        //                 .snapshots(),
        //             builder: (context, AsyncSnapshot snapshot) {
        //               return ListView.builder(
        //                   itemCount: snapshot.data.docs.length,
        //                   itemBuilder: (context, index) {
        //                     Future.delayed(const Duration(milliseconds: 500));
        //                     debugPrint(
        //                         ".......................imgurl.........");
        //                     debugPrint(
        //                       snapshot.data.docs[index]["ImageUrl"].toString(),
        //                     );
        //                     return Row(
        //                       children: [
        //                         //ListTile(
        //                         //   title:
        //                         Text(
        //                             "${snapshot.data.docs[index]["Service Name"]}"),
        //                         // subtitle:
        //                         Text(
        //                             "${snapshot.data.docs[index]["Service Category Name"]}"),

        //                         //  leading:
        //                         Container(
        //                           height: 80,
        //                           width: 80,
        //                           color: Colors.cyan,
        //                           child: Image.network(
        //                             snapshot.data.docs[index]["ImageUrl"]
        //                                 .toString(),
        //                             fit: BoxFit.cover,
        //                             errorBuilder: (context, error, stackTrace) {
        //                               return Text(error.toString());
        //                             },
        //                           ),
        //                         ),
        //                       ],
        //                     );
        //                     // Future<Uint8List> data1 = UploadData().imgUrl(
        //                     //     context
        //                     //         .read<AuthCubit>()
        //                     //         .categoryNameController
        //                     //         .text);

        //                     // print(imageSnapshort.data);
        //                   });
        //             },
        //           ),
        //         )
        //       : const SizedBox()
        // ])),
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
                    debugPrint("////////////Correct///////////////");

                    context.read<AuthCubit>().serviceDataUpload(
                        file: serviceImage!,
                        serviceName: context
                            .read<AuthCubit>()
                            .serviceNameController
                            .text);
                    Navigator.of(context).pop();
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
