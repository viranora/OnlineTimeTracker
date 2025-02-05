import 'package:flutter/material.dart';

class TimerList extends StatelessWidget {
  final List<Map<String, String>> savedTimers;

  const TimerList({super.key, required this.savedTimers});

  @override
  Widget build(BuildContext context) {
    return savedTimers.isEmpty
        ? const Text('Kayıtlı Süre Yok', style: TextStyle(fontSize: 16))
        : SizedBox(
            height: 200, // Listeye yükseklik sınırı koyarak overflow'u engelle
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Dikey kaydırma
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Yatay kaydırma
                child: DataTable(
                  columnSpacing: 30,
                  columns: const [
                    DataColumn(label: Text('İsim')),
                    DataColumn(label: Text('Süre')),
                  ],
                  rows: savedTimers.map((time) {
                    return DataRow(cells: [
                      DataCell(Text(time['name']!)),
                      DataCell(Text(time['time']!)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          );
  }
}
