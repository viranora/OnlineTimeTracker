import 'package:flutter/material.dart';

class StopwatchList extends StatelessWidget {
  final List<Map<String, String>> savedTimes;

  const StopwatchList({super.key, required this.savedTimes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        savedTimes.isEmpty
            ? const Text('Kayıtlı Zaman Yok')
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('İsim')),
                    DataColumn(label: Text('Zaman')),
                  ],
                  rows: savedTimes.map((time) {
                    return DataRow(cells: [
                      DataCell(Text(time['name']!)),
                      DataCell(Text(time['time']!)),
                    ]);
                  }).toList(),
                ),
              ),
      ],
    );
  }
}
