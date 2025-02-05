import 'package:flutter/material.dart';
import 'group_chat.dart';
import 'group_challenges.dart';

class GroupDetailsScreen extends StatelessWidget {
  final String groupName;

  const GroupDetailsScreen({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    // Örnek grup üyeleri
    List<String> members = ['Üye 1', 'Üye 2', 'Üye 3'];

    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Grup Üyeleri',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...members
              .map((member) => ListTile(
                    title: Text(member),
                    onTap: () {
                      // Üye profiline gitmek için buraya ekleme yapabilirsiniz
                    },
                  ))
              .toList(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Grup Sohbeti'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroupChat(groupName: groupName)),
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
                    builder: (context) =>
                        GroupChallengesScreen(groupName: groupName)),
              );
            },
          ),
        ],
      ),
    );
  }
}
