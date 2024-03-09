import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/auth_cubit.dart';
import 'textfield_and_tittle.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({
    super.key,
    required this.serviceName,
  });
  final String serviceName;
  @override
  Widget build(BuildContext context) {
    Uint8List? categoryImage;
    //  List<TextEditingController> coltrillerList = [];
    return AlertDialog(
      title: const Text("Add Service Category"),
      content: SingleChildScrollView(
        child: Form(
          key: context.read<AuthCubit>().categoryKey,
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
                              child: SizedBox(
                                height: 100,
                                width: 130,

                                child: Image.memory(
                                  categoryImage!,
                                  fit: BoxFit.cover,
                                ),
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
                    String hourlyRate = context
                        .read<AuthCubit>()
                        .categoryAddIssueController
                        .text;
                    if (hourlyRate == "") {
                      return "Please add Issue";
                    }
                    return null;
                  }),
            ]),
          ),
        ),
      ),
      actions: [
        // ElevatedButton(
        //     onPressed: () {
        //       //   OpenFile.open(categoryImage!.path);
        //     },
        //     child: const Text("File")),
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
                   debugPrint("////////////Correct///////////////");
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
                        serviceName: serviceName,
                      );
                  Navigator.of(context).pop();
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
