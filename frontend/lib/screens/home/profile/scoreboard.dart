import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWeeklyTotal(context),
          const SizedBox(height: 20),
          _buildPreviousWeeks(context),
        ],
      ),
    );
  }

  Widget _buildWeeklyTotal(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bu Haftalık Toplam Puan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 40),
                const SizedBox(width: 10),
                const Text(
                  '80 Puan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviousWeeks(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4, // Örnek olarak son 4 hafta
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Önceki Hafta ${index + 1}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildDailyScores(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDailyScores(BuildContext context) {
    return Column(
      children: List.generate(7, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getDayName(index),
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '${(index + 1) * 10} Puan', // Örnek puanlar
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }),
    );
  }

  String _getDayName(int index) {
    const days = [
      'Pazartesi',
      'Salı',
      'Çarşamba',
      'Perşembe',
      'Cuma',
      'Cumartesi',
      'Pazar'
    ];
    return days[index];
  }
}
