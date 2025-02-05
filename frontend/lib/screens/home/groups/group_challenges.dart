import 'package:flutter/material.dart';
import 'add_challenge.dart'; // Yeni meydan okuma ekleme ekranı

class GroupChallengesScreen extends StatelessWidget {
  final String groupName;

  const GroupChallengesScreen({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    // Örnek meydan okuma listesi
    List<Map<String, String>> challenges = [
      {
        'challenge': 'Pomodoro Challenge',
        'group': groupName,
        'details': '25 dakika çalışma, 5 dakika mola.'
      },
      {
        'challenge': 'Deep Work Session',
        'group': groupName,
        'details': '90 dakika kesintisiz çalışma.'
      },
      {
        'challenge': 'Break Timer Challenge',
        'group': groupName,
        'details': 'Her 30 dakikada 5 dakika mola.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meydan Okumalar - $groupName'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Meydan okuma detaylarına gitmek için buraya ekleme yapabilirsiniz
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      challenges[index]['challenge']!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Grup: ${challenges[index]['group']}',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      challenges[index]['details']!,
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddChallengeScreen()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Yeni Meydan Okuma Ekle'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
