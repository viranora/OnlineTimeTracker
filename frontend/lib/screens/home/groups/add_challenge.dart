import 'package:flutter/material.dart';

class AddChallengeScreen extends StatefulWidget {
  const AddChallengeScreen({super.key});

  @override
  State<AddChallengeScreen> createState() => _AddChallengeScreenState();
}

class _AddChallengeScreenState extends State<AddChallengeScreen> {
  // Örnek grup listesi
  List<String> groups = ['Grup 1', 'Grup 2', 'Grup 3'];
  List<String> selectedGroups = [];
  String challengeName = '';
  String challengeDetails = '';
  int duration = 0; // Dakika cinsinden süre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Meydan Okuma Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Meydan Okuma Adı',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  challengeName = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Meydan Okuma İçeriği',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  challengeDetails = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Süre (dakika)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  duration = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Hangi Gruplarla Yapılacak?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(groups[index]),
                    trailing: Checkbox(
                      value: selectedGroups.contains(groups[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedGroups.add(groups[index]);
                          } else {
                            selectedGroups.remove(groups[index]);
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
                  // Meydan okuma oluşturma işlemi burada yapılabilir
                  Navigator.pop(context);
                },
                child: const Text('Meydan Okuma Ekle'),
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
      ),
    );
  }
}
