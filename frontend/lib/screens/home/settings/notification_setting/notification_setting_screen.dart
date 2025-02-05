import 'package:flutter/material.dart';
import 'friend_request_screen.dart';
import 'group_request_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İstekler')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Arkadaşlık İstekleri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FriendRequestScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Grup İstekleri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GroupRequestScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
