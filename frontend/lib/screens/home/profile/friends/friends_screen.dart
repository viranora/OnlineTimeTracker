import 'package:flutter/material.dart';
import 'friends_list.dart';
import 'friends_search.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arkadaşlar')),
      body: Column(
        children: [
          const FriendsSearch(), // Arama kısmı burada ekleniyor
          Expanded(child: const FriendsList()), // Arkadaş listesi
        ],
      ),
    );
  }
}
