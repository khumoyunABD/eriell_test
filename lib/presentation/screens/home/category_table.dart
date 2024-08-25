import 'package:flutter/material.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual Table implementation
    return Material(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Category Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Airlines')),
                      DataColumn(label: Text('Car Brands')),
                      DataColumn(label: Text('IT')),
                      //DataColumn(label: Text('Technology')),
                    ],
                    rows: List<DataRow>.generate(
                      6,
                      (index) => const DataRow(
                        cells: [
                          DataCell(Text('Sample')),
                          DataCell(Text('Car Engine')),
                          DataCell(Text('Headset')),
                          //DataCell(Text('Raspberry PI')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
