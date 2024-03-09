import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:webapp/core/color_and_font.dart';

class PayoutsScreen extends StatefulWidget {
  const PayoutsScreen({super.key});

  @override
  State<PayoutsScreen> createState() => _PayoutsScreenState();
}

class _PayoutsScreenState extends State<PayoutsScreen> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

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
                "Payouts of November",
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
        label: Text('No of services receved'),
      ),
      const DataColumn(
        label: Text('Payouts'),
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
        const DataCell(Text('Worker1')),
        const DataCell(Text('5')),
        const DataCell(Text('700')),
        DataCell(ElevatedButton(
          child: const Text("PayNow"),
          onPressed: () {
            openCheckout();
            // showDialog(
            //     context: context, builder: (_) => const TransactionDetails());
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('11100')),
        const DataCell(Text('Worker 2')),
        const DataCell(Text('10')),
        const DataCell(Text('1500')),
        DataCell(ElevatedButton(
          child: const Text("PayNow"),
          onPressed: () {},
        )),
      ]),
    ];
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }
}
