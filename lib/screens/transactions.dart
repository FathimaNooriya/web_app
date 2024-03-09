import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .9,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Transaction",
                  style: ColorAndFont.TITTLE_TEXT,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Received Payments",
              style: ColorAndFont.Normal_TEXT_BOLD,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: createDataTable(context: context)),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Send Payments",
              style: ColorAndFont.Normal_TEXT_BOLD,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: sentTransactionTable(context: context)),
          ],
        ),
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
                context: context, builder: (_) => const TransactionDetails());
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

  DataTable sentTransactionTable({required context}) {
    return DataTable(
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 236, 73, 73)),
        border: TableBorder.symmetric(
          outside: const BorderSide(
            color: Color.fromARGB(255, 57, 179, 159),
          ),
        ),
        columns: _createColumns2(),
        rows: _createRows2(
          context: context,
        ));
  }

  List<DataColumn> _createColumns2() {
    return [
      const DataColumn(
        label: Text('Payment ID'),
      ),
      const DataColumn(
        label: Text('Worker ID'),
      ),
      const DataColumn(
        label: Text('Worker Name'),
      ),
      const DataColumn(
        label: Text('No of srevices done'),
      ),
      const DataColumn(
        label: Text('Payouts'),
      ),
      const DataColumn(
        label: Text('Date of Payment'),
      ),
      const DataColumn(
        label: Text('    '),
      ),
    ];
  }

  List<DataRow> _createRows2({required context}) {
    return [
      DataRow(cells: [
        const DataCell(Text('111536')),
        const DataCell(Text('555151')),
        const DataCell(Text('Worker 1')),
        const DataCell(Text('5')),
        const DataCell(Text('500')),
        const DataCell(Text('10/11/23')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {
            showDialog(
                context: context, builder: (_) => const TransactionDetails());
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('21561')),
        const DataCell(Text('55414')),
        const DataCell(Text('Worker 2')),
        const DataCell(Text('10')),
        const DataCell(Text('1500')),
        const DataCell(Text('10/11/23')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {},
        )),
      ]),
    ];
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

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
