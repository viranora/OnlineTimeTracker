import 'package:flutter/material.dart';
import 'friends_profile_setting.dart'; // FriendsProfileSettings dosyasını import et

class FriendProfile extends StatelessWidget {
  final Map<String, dynamic> friend;

  const FriendProfile({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arkadaş Profili'),
        actions: [
          FriendsProfileSettings(), // Üç çizgili seçenekler menüsü burada
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(friend['profileImage']!),
                radius: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              friend['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              friend['status']!,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Arkadaşı gruba ekleme işlevi buraya eklenebilir
              },
              icon: const Icon(Icons.group_add),
              label: const Text('Arkadaşını Gruba Ekle'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Diğer profil bilgileri buraya eklenebilir
          ],
        ),
      ),
    );
  }
}
