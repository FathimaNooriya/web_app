
import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/screens/dashboad.dart';
import 'package:webapp/main.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool visibleTable = true;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .9,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("User Id : 55524", style: ColorAndFont.TITTLE_TEXT),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 7,
              ),
              child: Card(
                color: const Color.fromARGB(195, 186, 233, 225),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(195, 186, 233, 225),
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/images/9485622.png"),
                              ),
                              FilledButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red, // background
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2))),
                                  onPressed: () {},
                                  child: Text("Bloc",
                                      style: ColorAndFont.BUTTON_TEXT)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Name : ",
                                    style: ColorAndFont.Sm_TEXT_BOLD_BLACK,
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "Fathima Nooriya\n",
                                      style: ColorAndFont.Sm_TEXT_BOLD_GRAY),
                                  TextSpan(
                                      text: "Phone Number : ",
                                      style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                                  TextSpan(
                                      text: "9874563210\n",
                                      style: ColorAndFont.Sm_TEXT_BOLD_GRAY),
                                  TextSpan(
                                      text: "Email Address : ",
                                      style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                                  TextSpan(
                                      text: "fathima@gmail.com\n",
                                      style: ColorAndFont.Sm_TEXT_BOLD_GRAY),
                                  TextSpan(
                                      text: "Location : ",
                                      style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                                  TextSpan(
                                      text: "Kadavanthra\n",
                                      style: ColorAndFont.Sm_TEXT_BOLD_GRAY),
                                  TextSpan(
                                      text: "Address : ",
                                      style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                                  TextSpan(
                                      text:
                                          "ABCD Apartments\nVinayaka Road, Aluva\nErnakulam  ",
                                      style: ColorAndFont.Sm_TEXT_BOLD_GRAY),
                                ])),
                            // Text(" Phone Number : 9874563210",
                            //     style: ColorAndFont.Normal_TEXT_BOLD),
                            // Text("Email Address : fathima@gmail.com",
                            //     style: ColorAndFont.Normal_TEXT_BOLD),
                            // Text("Location : Kadavanthra",
                            //     style: ColorAndFont.Normal_TEXT_BOLD),
                            // Text(
                            //     "Address : ABCD Apartments\nVinayaka Road, Aluva\nErnakulam  ",
                            //     style: ColorAndFont.Normal_TEXT_BOLD),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .13,
                            ),
                            Text("Total no of",
                                style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                            Text("Services  Received",
                                style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                            Card(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text("10",
                                  style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                            ))
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text("3.9",
                                      style:
                                          ColorAndFont.Normal_TEXT_BOLD_BLACK),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: ColorAndFont.BLACK,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text("Services received",
                                  style: ColorAndFont.Normal_TEXT_BOLD_BLACK),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .36,
                              width: MediaQuery.of(context).size.width * .35,
                              child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      elevation: 3,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "#2255",
                                                  style: ColorAndFont
                                                      .Sm_TEXT_BOLD_GRAY,
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  color: Colors.brown,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        text: "Worker: ",
                                                        style: ColorAndFont
                                                            .Sm_TEXT_BOLD_BLACK,
                                                        children: <TextSpan>[
                                                      TextSpan(
                                                          text: "Jain Paul\n",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_GRAY),
                                                      TextSpan(
                                                          text: "Service : ",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_BLACK),
                                                      TextSpan(
                                                          text: "Plumbing\n",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_GRAY),
                                                      TextSpan(
                                                          text: "Slot : ",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_BLACK),
                                                      TextSpan(
                                                          text:
                                                              "12 oct 2023 : 2 PM - 4 PM\n",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_GRAY),
                                                      TextSpan(
                                                          text: "Issue : ",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_BLACK),
                                                      TextSpan(
                                                          text:
                                                              "Kitchen sink Repairs",
                                                          style: ColorAndFont
                                                              .Sm_TEXT_BOLD_GRAY),
                                                    ])),
                                              ],
                                            ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Card(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Accepted",
                                                      style: ColorAndFont
                                                          .Sm_TEXT_BOLD_BLACK,
                                                    ),
                                                  )),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .05,
                                                  ),
                                                  Text(
                                                    "₹ 500",
                                                    style: ColorAndFont
                                                        .Sm_TEXT_BOLD_BLACK,
                                                  ),
                                                ]),
                                          ]),
                                    );
                                  }),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * .38,
                            //   child: Expanded(
                            //     child: Divider(
                            //       thickness: 1,
                            //       color: ColorAndFont.BLACK,
                            //     ),
                            //   ),
                            // ),
                            Row(
                              children: [
                                Text(" Pending Payments:    ",
                                    style: ColorAndFont.Normal_TEXT_BOLD_BLACK),
                                Card(
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Text("400",
                                        style: ColorAndFont.Sm_TEXT_BOLD_BLACK),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorAndFont.GREEN,
                                  ),
                                  onPressed: () {
                                    visibleTable = !visibleTable;
                                    index = 6;
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (conext) =>
                                                const DashboardScreen()));
                                  },
                                  child: Text("Previous Payments",
                                      style:
                                          ColorAndFont.Normal_TEXT_BOLD_BLACK)),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * .54,
                        //   child: Expanded(
                        //     child: VerticalDivider(
                        //       thickness: 2,
                        //       color: ColorAndFont.BLACK,
                        //     ),
                        //   ),
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Reviews and Ratings",
                                  style: ColorAndFont.Normal_TEXT_BOLD_BLACK),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .48,
                              width: MediaQuery.of(context).size.width * .4,
                              child: ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Fathima Nooriya",
                                                  style: ColorAndFont
                                                      .Normal_TEXT_BOLD_BLACK,
                                                ),
                                                SizedBox(
                                                  width: 180,
                                                  height: 30,
                                                  child: ListView.builder(
                                                      itemCount: 5,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "I had the pleasure of using Jain Paul's services, and I can confidently give them a 5-star rating. Their prompt response, professionalism, transparent communication, and impeccable plumbing skills were truly impressive. They left my home spotless after the repair, and their pricing was fair. I highly recommend Jain Paul for any plumbing needs – they are undoubtedly the best in the business, and I'll be calling them for any future issues. Thank you for your exceptional service! ",
                                                style: ColorAndFont
                                                    .Sm_TEXT_BOLD_BLACK),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          visibleTable
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Previous Payments",
                      style: ColorAndFont.Normal_TEXT_BOLD_BLACK,
                    ),
                  ),
                )
              : const SizedBox(),
          visibleTable
              ? Center(child: userPreviousPaymentsTable(context: context))
              : const SizedBox(),
        ]),
      ),
    );
  }

  DataTable userPreviousPaymentsTable({required context}) {
    return DataTable(
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 57, 179, 159)),
        border: TableBorder.symmetric(
          outside: const BorderSide(
            color: Color.fromARGB(255, 57, 179, 159),
          ),
        ),
        columns: _createColumns(),
        rows: _createRows(
          context: context,
        ));
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text('Payment ID'),
      ),
      const DataColumn(
        label: Text('Service ID'),
      ),
      const DataColumn(
        label: Text('Worker ID'),
      ),
      const DataColumn(
        label: Text('Amount'),
      ),
      const DataColumn(
        label: Text('Date of Payment'),
      ),
      const DataColumn(
        label: Text('    '),
      ),
    ];
  }

  List<DataRow> _createRows({required context}) {
    return [
      DataRow(cells: [
        const DataCell(Text('1')),
        const DataCell(Text('Service 1')),
        const DataCell(Text('Worker 1')),
        const DataCell(Text('500')),
        const DataCell(Text('10/11/23')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => const UserPreviousTransactionDetails());
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('1')),
        const DataCell(Text('Service 1')),
        const DataCell(Text('Worker 1')),
        const DataCell(Text('500')),
        const DataCell(Text('10/11/23')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {},
        )),
      ]),
    ];
  }
}

class UserPreviousTransactionDetails extends StatelessWidget {
  const UserPreviousTransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Transaction Details"),
      content: const FittedBox(
        fit: BoxFit.contain,
        child: Column(children: [
          Text("Payment Id: 100237"),
          Text(" Date of payment : 12-07-2023"),
          Text(" Method of payment :  RazorPay"),
          Text(" Type of Service :  Plumbing"),
          Text(" Worker in-charge of service  :  Jain Paul"),
          Text(" User Received the service  :  Fathima  Nooriya")
        ]),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"))
      ],
    );
  }
}
