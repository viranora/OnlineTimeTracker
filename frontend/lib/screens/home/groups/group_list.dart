import 'package:flutter/material.dart';
import 'group_details.dart';
import 'add_group.dart'; // Yeni grup ekleme ekranı

class GroupListScreen extends StatelessWidget {
  const GroupListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek grup listesi
    List<String> groups = ['Grup 1', 'Grup 2', 'Grup 3'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grup Listesi'),
      ),
      body: ListView.builder(
        itemCount:
            groups.length + 1, // Eklenen grup sayısını ve butonu dahil ediyoruz
        itemBuilder: (context, index) {
          if (index < groups.length) {
            return ListTile(
              title: Text(groups[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GroupDetailsScreen(groupName: groups[index]),
                  ),
                );
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddGroupScreen()),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Yeni Grup Ekle'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
