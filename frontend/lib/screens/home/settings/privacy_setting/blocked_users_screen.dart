import 'package:flutter/material.dart';

class BlockedUsersScreen extends StatelessWidget {
  final List<String> blockedUsers;

  const BlockedUsersScreen({super.key, required this.blockedUsers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engellenen Kullanıcılar'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: blockedUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(blockedUsers[index]),
          );
        },
      ),
    );
  }
}
