import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/screens/dashboad.dart';
import 'package:webapp/main.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

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
                "Users",
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
        label: Text('User ID'),
      ),
      const DataColumn(
        label: Text('Name'),
      ),
      const DataColumn(
        label: Text('Location'),
      ),
      const DataColumn(
        label: Text('No of services receved'),
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
        const DataCell(Text('Fathima')),
        const DataCell(Text('Kalur')),
        const DataCell(Text('10')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {
            index = 6;

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DashboardScreen()));
            // showDialog(
            //     context: context, builder: (_) => const TransactionDetails());
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('11100')),
        const DataCell(Text('Nooriya')),
        const DataCell(Text('Kochi')),
        const DataCell(Text('5')),
        DataCell(ElevatedButton(
          child: const Text("View"),
          onPressed: () {},
        )),
      ]),
    ];
  }
}
