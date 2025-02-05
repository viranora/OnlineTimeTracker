import 'package:flutter/material.dart';
import 'friends_profile.dart'; // FriendProfile dosyasını import et

class FriendCard extends StatelessWidget {
  final Map<String, dynamic> friend;

  const FriendCard({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    bool isOnline = friend['isOnline'] ?? false; // Varsayılan değer false

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(friend['profileImage']!),
              radius: 30,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: isOnline ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        title: Text(
          friend['name']!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          friend['status']!,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendProfile(friend: friend),
            ),
          );
        },
      ),
    );
  }
}
