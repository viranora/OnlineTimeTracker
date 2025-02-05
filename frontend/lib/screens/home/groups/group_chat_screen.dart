import 'package:flutter/material.dart';
import 'group_chat.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key, required String groupName});

  @override
  Widget build(BuildContext context) {
    // Örnek grup listesi
    List<String> groups = ['Grup 1', 'Grup 2', 'Grup 3'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grup Sohbetleri'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groups[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupChat(groupName: groups[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
