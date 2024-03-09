
import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/screens/dashboad.dart';
import 'package:webapp/main.dart';

// class WokerScerrn extends StatefulWidget {
//   const WokerScerrn({super.key});

//   @override
//   State<WokerScerrn> createState() => _WokerScerrnState();
// }

// class _WokerScerrnState extends State<WokerScerrn> {
//   late Razorpay _razorpay;
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//     Container(
//       child: ElevatedButton(
//           child: Text("Payment"),
//           onPressed: () {
//             openCheckout();
//           }),
//     );
//   }

//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_test_1DP5mmOlF5G5ag',
//       'amount': 100,
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     log('Success Response: $response');
//     Fluttertoast.showToast(
//         msg: "SUCCESS: ${response.paymentId!}",
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     log('Error Response: $response');
//     Fluttertoast.showToast(
//         msg: "ERROR: ${response.code} - ${response.message!}",
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     log('External SDK Response: $response');
//     Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: ${response.walletName!}",
//         toastLength: Toast.LENGTH_SHORT);
//   }
// }

class WokerScerrn extends StatelessWidget {
  const WokerScerrn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Workers",
                style: ColorAndFont.TITTLE_TEXT,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(child: createDataTable(context: context)),
        ],
      ),
    );
  }

  DataTable createDataTable({required context}) {
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
        label: Text('Worker ID'),
      ),
      const DataColumn(
        label: Text('Name'),
      ),
      const DataColumn(
        label: Text('Location'),
      ),
      const DataColumn(
        label: Text('Services Name'),
      ),
      const DataColumn(
        label: Text('No of services done'),
      ),
      const DataColumn(
        label: Text('    '),
      ),
    ];
  }

  List<DataRow> _createRows({required context}) {
    return [
      DataRow(cells: [
        const DataCell(Text('101010')),
        const DataCell(Text('Assainar')),
        const DataCell(Text('Kochi')),
        const DataCell(Text('Electrition')),
        const DataCell(Text('20')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {
            index = 7;

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DashboardScreen()));
            // showDialog(
            //     context: context, builder: (_) => const TransactionDetails());
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('11100')),
        const DataCell(Text('Jain Paul')),
        const DataCell(Text('Kochi')),
        const DataCell(Text('Plumber')),
        const DataCell(Text('10')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {},
        )),
      ]),
    ];
  }
}

// class TransactionDetails extends StatelessWidget {
//   const TransactionDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Transaction Details"),
//       content: const FittedBox(
//         fit: BoxFit.contain,
//         child: Column(children: [
//           Text("Payment Id: 100237"),
//           Text(" Date of payment : 12-07-2023"),
//           Text(" Method of payment :  RazorPay"),
//           Text(" Type of Service :  Plumbing"),
//           Text(" Worker in-charge of service  :  Jain Paul"),
//           Text(" User Received the service  :  Fathima  Nooriya")
//         ]),
//       ),
//       actions: [
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("OK"))
//       ],
//     );
//   }
// }
