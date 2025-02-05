import 'package:flutter/material.dart';

class GroupRequestScreen extends StatelessWidget {
  const GroupRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grup İstekleri')),
      body: Center(
        child: Text(
          'Grup İstekleri Ekranı',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
