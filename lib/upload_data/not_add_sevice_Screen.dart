import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/logic/cubit/auth_cubit.dart';

class AddServiceScerren2 extends StatefulWidget {
  const AddServiceScerren2({
    super.key,
  });

  @override
  State<AddServiceScerren2> createState() => _AddServiceScerren2State();
}

class _AddServiceScerren2State extends State<AddServiceScerren2> {
  List<TextEditingController> coltrillerList = [];
  @override
  Widget build(BuildContext con) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .9,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .18,
              vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorAndFont.BLACK)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Add Service",
                    style: ColorAndFont.TITTLE_TEXT,
                  ),
                ),
                const Divider(
                  color: ColorAndFont.BLACK,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: context.read<AuthCubit>().serviceKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                              //   if (state is ImageSelected) {
                              //     GestureDetector(
                              //       child: Container(
                              //         height: 100,
                              //         width: 100,
                              //         color: const Color.fromARGB(255, 183, 125, 58),
                              //         //child: Text("${context.read<AuthCubit>().state.}"),
                              //         //print(context.read<AuthCubit>().myImage.sublist(0,).toString()),
                              //         //child: MemoryImage(context.read<AuthCubit>().selectedImage[0]),
                              //       ),
                              //       onTap: () {
                              //         context.read<AuthCubit>().selectCategoryImage();
                              //       },
                              //     );
                              //   }
                              // }, builder: (context, state) {
                              //   if (state is ImageLoading) {
                              //     return const Center(
                              //       child: CircularProgressIndicator(),
                              //     );
                              //   }
                              //   return
                              GestureDetector(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  color: ColorAndFont.GREEN,
                                ),
                                onTap: () async {
                                  // XFile? imagePic = await ImagePicker()
                                  //     .pickImage(source: ImageSource.gallery);
                                  // print(imagePic);
                                  context
                                      .read<AuthCubit>()
                                      .selectCategoryImage();
                                },
                              ),
                              // );
                              // }),
                              Column(
                                children: [
                                  Text(
                                    "Service Name",
                                    style: ColorAndFont.Normal_TEXT_BOLD_BLACK,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: context
                                          .read<AuthCubit>()
                                          .serviceNameController,
                                      validator: (value) {
                                        String hourlyRate = context
                                            .read<AuthCubit>()
                                            .serviceNameController
                                            .text;
                                        if (hourlyRate == "") {
                                          return "Enter a Valid Service Name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Service Category",
                              style: ColorAndFont.Normal_TEXT_BOLD_BLACK,
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: ColorAndFont.GREEN,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle,
                                  color: ColorAndFont.GREEN),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      "Add hourly rate",
                                      style:
                                          ColorAndFont.Normal_TEXT_BOLD_BLACK,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    child: TextFormField(
                                      controller: context
                                          .read<AuthCubit>()
                                          .serviceHourlyRateController,
                                      validator: (value) {
                                        String hourlyRate = context
                                            .read<AuthCubit>()
                                            .serviceHourlyRateController
                                            .text;
                                        if (hourlyRate == "") {
                                          return "Enter a valid hourly rate";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text("Add Issue",
                                        style: ColorAndFont
                                            .Normal_TEXT_BOLD_BLACK),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    child: TextFormField(
                                      controller: context
                                          .read<AuthCubit>()
                                          .serviceAddIssueController,
                                      validator: (value) {
                                        String hourlyRate = context
                                            .read<AuthCubit>()
                                            .serviceAddIssueController
                                            .text;
                                        if (hourlyRate == "") {
                                          return "Please add Issue";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: IconButton(
                                onPressed: () {
                                  coltrillerList.add(TextEditingController());
                                },
                                icon: const Icon(Icons.add_circle,
                                    color: ColorAndFont.GREEN),
                              ),
                            ),
                          ],
                        ),
                        // coltrillerList.isNotEmpty
                        //     ? ListView.builder(
                        //         itemCount: coltrillerList.length,
                        //         itemBuilder: (BuildContext context, int index) {
                        //           return TextFormField(
                        //             decoration: InputDecoration(
                        //               border: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10)),
                        //             ),
                        //           );
                        //         })
                        //     : SizedBox()

                        // Close the dialog
                        // You can use the CupertinoDialogAction widget instead
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorAndFont.GREEN),
                              child:
                                  Text('Save', style: ColorAndFont.BUTTON_TEXT),
                              onPressed: () {
                                final bool val = context
                                    .read<AuthCubit>()
                                    .serviceKey
                                    .currentState!
                                    .validate();
                                if (val) {
                                  // debugPrint(
                                  //     "////////////Correct///////////////");
                                  //     SaveService(serviceName: context.read<AuthCubit>().serviceNameController.text ,ratePerHour:double.parse(context.read<AuthCubit>().serviceAddIssueController.text) ,issue:context.read<AuthCubit>().serviceAddIssueController.text ,imgFile: );
                                } else {
                                  debugPrint(
                                      "////////////Not Correct///////////////");
                                  return;
                                }

                                // Then close the dialog
                                //          Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void SaveService(
//     {required String serviceName,
//     required double ratePerHour,
//     required String issue,
//     required Uint8List imgFile}) async {
//   String resp = await StoreData().SaveData(
//       ServiceName: serviceName,
//       RatePerHr: ratePerHour,
//       Issue: issue,
//       file: imgFile);
// }
