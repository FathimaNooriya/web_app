import 'package:flutter/material.dart';
import 'package:webapp/screens/service_sr.dart';
import 'package:webapp/upload_data/not_add_sevice_Screen.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/main.dart';
import 'package:webapp/screens/payouts.dart';

import 'package:webapp/screens/transactions.dart';
import 'package:webapp/screens/user.dart';
import 'package:webapp/widgets/user_detail.dart';
import 'package:webapp/screens/worker.dart';
import 'package:webapp/widgets/worker_details.dart';

import '../widgets/category.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        backgroundColor: ColorAndFont.GREEN,
        title: Text(
          "FixMyNest",
          style: ColorAndFont.TITTLE_Wt_TEXT,
        ),
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .91,
                width: 240,
                // width: MediaQuery.of(context).size.width * .18,
                color: ColorAndFont.GREEN,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: NavigationRail(
                    extended: true,
                    backgroundColor: ColorAndFont.GREEN,
                    selectedIconTheme:
                        const IconThemeData(color: ColorAndFont.WHITE),
                    unselectedIconTheme: const IconThemeData(
                      color: Color.fromARGB(158, 255, 255, 255),
                    ),
                    onDestinationSelected: (value) => setState(() {
                      index = value;
                    }),
                    selectedLabelTextStyle: ColorAndFont.BUTTON_TEXT,
                    unselectedLabelTextStyle: ColorAndFont.Normal_wt_TEXT,
                    //  indicatorColor: const Color.fromARGB(255, 54, 72, 105),
                    useIndicator: false,
                    groupAlignment: -1,
                    elevation: 10,
                    //   leading: Divider(),
                    // trailing: Divider(),
                    // labelType: ,
                    //  labelType: ,
                    destinations: [
                      const NavigationRailDestination(
                        icon: Icon(Icons.dashboard),
                        label: Text(
                          "Dashboard",
                        ),
                      ),
                      const NavigationRailDestination(
                          icon: Icon(Icons.home_repair_service),
                          label: Text(
                            "Services",
                          )),
                      const NavigationRailDestination(
                          icon: Icon(Icons.supervised_user_circle_sharp),
                          label: Text(
                            "Workers",
                          )),
                      const NavigationRailDestination(
                        icon: Icon(Icons.account_circle_sharp),
                        label: Text(
                          "Users",
                        ),
                      ),
                      const NavigationRailDestination(
                        icon: Icon(Icons.transform_outlined),
                        label: Text(
                          "Transaction",
                        ),
                      ),
                      const NavigationRailDestination(
                          icon: Icon(Icons.money_rounded),
                          label: Text(
                            "Payouts",
                          )),
                      NavigationRailDestination(
                        disabled: true,
                        icon: const Icon(
                          Icons.add_circle,
                          size: 5,
                          color: ColorAndFont.GREEN,
                        ),
                        label:
                            Text("User details", style: ColorAndFont.SM_TEXT),
                      ),
                      NavigationRailDestination(
                        disabled: true,
                        icon: const Icon(
                          Icons.add_circle,
                          size: 5,
                          color: ColorAndFont.GREEN,
                        ),
                        label:
                            Text("Worker details", style: ColorAndFont.SM_TEXT),
                      ),
                      const NavigationRailDestination(
                        //disabled: true,
                        icon: Icon(
                          Icons.add_circle,
                          //  size: 5,
                          // color: ColorAndFont.GREEN,
                        ),
                        label: Text(
                          "Add Service ",
                          //  style: ColorAndFont.SM_TEXT
                        ),
                      ),
                      NavigationRailDestination(
                        disabled: true,
                        icon: const Icon(
                          Icons.add_circle,
                          size: 5,
                          color: ColorAndFont.GREEN,
                        ),
                        label: Text("Category", style: ColorAndFont.SM_TEXT),
                      ),
                    ],
                    selectedIndex: index,
                  ),
                ),
              )
              // Container(
              //   height: MediaQuery.of(context).size.height * .9,
              //   width: MediaQuery.of(context).size.width * .15,
              //   color: const Color.fromARGB(255, 57, 179, 159),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           dashboard = true;
              //           setState(() {});
              //         },
              //         child: const Text("Dashboard"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           services = !services;
              //           setState(() {});
              //         },
              //         child: const Text("Services"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           worker = !worker;
              //           setState(() {});
              //         },
              //         child: const Text("Workers"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           user = !user;
              //           setState(() {});
              //         },
              //         child: const Text("Users"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           transaction = !transaction;
              //           setState(() {});
              //         },
              //         child: const Text("Transaction"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           payout = !payout;
              //           setState(() {});
              //         },
              //         child: const Text("Payouts"),
              //       ),
              //       const Divider(
              //         color: Color.fromARGB(255, 182, 180, 180),
              //         height: 10,
              //       ),
              //     ],
              //   ),
              ,
              SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: buildPages()),
              // services
              //     ? const ServiceScreen()
              //     : worker
              //         ? const WokerScerrn()
              //         : transaction
              //             ? const TransactionsScreen()
              //             : user
              //                 ? const UserScreen()
              //                 : payout
              //                     ? const PayoutsScreen()
              //                     : const DashBoardView()
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const DashBoardView();
      case 1:
        return const ServiceScreen();
      case 2:
        return const WokerScerrn();
      case 3:
        return const UserScreen();
      case 4:
        return const TransactionsScreen();
      case 5:
        return const PayoutsScreen();
      case 6:
        return const UserDetailsScreen();
      case 7:
        return const WorkerDetailsScreen();
      case 8:
        return const AddServiceScerren2();
      case 9:
        return const CategoryScreen();
    }
    return const DashBoardView();
  }
}

class DashBoardView extends StatelessWidget {
  const DashBoardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Welcome to  FixMyNest"),
              ),
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width * .80,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext condext, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Card(
                        color: Color.fromARGB(90, 57, 179, 159),
                        child: SizedBox(
                          height: 200,
                          width: 200,
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Valuable customers"),
              ),
              SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width * .80,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext condext, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Card(
                        color: Color.fromARGB(90, 192, 197, 197),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 270,
                            width: 190,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 80,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Fathima"),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.location_city),
                                    Text("Kundannur"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("No of Services Booked : 20"),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text("4.3"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Best Performers"),
              ),
              SizedBox(
                height: 280,
                width: MediaQuery.of(context).size.width * .80,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext condext, index) {
                    return const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Card(
                          color: Color.fromARGB(90, 192, 197, 197),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 190,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Priya Reji"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.location_city),
                                      Text("Kochi"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("No of Services : 28"),
                                  Text(
                                    "Plumber",
                                    textAlign: TextAlign.end,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("₹ 400/hr"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text("4.3"),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("High Rated Services"),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width * .80,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext condext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Card(
                        color: const Color.fromARGB(90, 192, 197, 197),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 190,
                            child: Column(children: [
                              Container(
                                height: 140,
                                width: 180,
                                color: const Color.fromARGB(255, 10, 59, 99),
                              ),
                              const Text("Vaccum Cleaning"),
                            ]),
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
