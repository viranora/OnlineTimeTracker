import 'package:flutter/material.dart';

class CommunityContent extends StatelessWidget {
  const CommunityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMedal(
                context, '2. Samuel', Colors.grey, 'assets/silver_medal.png'),
            _buildMedal(
                context, '1. Sarah', Colors.yellow, 'assets/gold_medal.png'),
            _buildMedal(
                context, '3. Sandra', Colors.blue, 'assets/bronze_medal.png'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Liderlik Tablosu',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildLeaderboardItem('1. Sarah', 'Aktiflik Puanı: 980'),
        _buildLeaderboardItem('2. Samuel', 'Aktiflik Puanı: 870'),
        _buildLeaderboardItem('3. Sandra', 'Aktiflik Puanı: 860'),
        _buildLeaderboardItem('4. Sophie', 'Aktiflik Puanı: 850'),
        _buildLeaderboardItem('5. Stephen', 'Aktiflik Puanı: 830'),
      ],
    );
  }

  Widget _buildMedal(
      BuildContext context, String name, Color color, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Image.asset(imagePath),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem(String name, String score) {
    return ListTile(
      leading: const Icon(Icons.leaderboard),
      title: Text(name),
      subtitle: Text(score),
    );
  }
}
