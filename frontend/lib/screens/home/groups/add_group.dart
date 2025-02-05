import 'package:flutter/material.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  // Örnek arkadaş listesi
  List<String> friends = ['Arkadaş 1', 'Arkadaş 2', 'Arkadaş 3'];
  List<String> selectedFriends = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Grup Ekle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(friends[index]),
                  trailing: Checkbox(
                    value: selectedFriends.contains(friends[index]),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedFriends.add(friends[index]);
                        } else {
                          selectedFriends.remove(friends[index]);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Gruba ekleme işlemi burada yapılabilir
                Navigator.pop(context);
              },
              child: const Text('Gruba Ekle'),
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
