import 'package:flutter/material.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arkadaşlık İstekleri')),
      body: Center(
        child: Text(
          'Arkadaşlık İstekleri Ekranı',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
