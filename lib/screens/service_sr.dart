import 'package:flutter/material.dart';
import '../core/color_and_font.dart';
import '../main.dart';
import '../widgets/add_category.dart';
import '../widgets/add_service.dart';
import 'dashboad.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      height: MediaQuery.of(context).size.height * .85,
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
                    child: Text("Services", style: ColorAndFont.TITTLE_TEXT),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context, builder: (_) => const AddService());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Service"),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 2.5 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 30,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int myindex) {
                  return Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            InkWell(
                              child: Container(
                                height: 150,
                                width: 200,
                                color: Colors.amber,
                              ),
                              onTap: () {
                                index = 9;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardScreen()));

                                // context.read<AuthCubit>().loadata();
                                // showDialog(
                                //     context: context,
                                //     builder: (_) => const ServiceView(
                                //           serviceName: "Plumbing",
                                //           serviceImage: "image",
                                //           //  lenthdata: length,
                                //         ));
                              },
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => const AddCategory(
                                          serviceName: "Plumbing",
                                        ));
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Category"),
                            )
                          ],
                        ),
                      ),
                      const Text("Plumbing"),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
