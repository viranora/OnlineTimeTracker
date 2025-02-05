import 'package:flutter/material.dart';
import 'group_chat_screen.dart';
import 'group_list.dart';
import 'group_challenges.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gruplar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Grup Listesi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GroupListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Grup Sohbeti'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GroupChatScreen(
                          groupName: '',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Grup Meydan Okumaları'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GroupChallengesScreen(
                          groupName: '',
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
