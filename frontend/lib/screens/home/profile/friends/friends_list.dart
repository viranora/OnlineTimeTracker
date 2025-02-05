import 'package:flutter/material.dart';
import 'friends_card.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek arkadaş verileri
    final List<Map<String, String>> friends = [
      {
        'name': 'ojrefeş',
        'profileImage': 'assets/profile1.jpg',
        'status': 'jdşsjf!'
      },
      {
        'name': 'şdrfojşe',
        'profileImage': 'assets/profile2.jpg',
        'status': 'Yefmşwfekmş'
      },
      {
        'name': 'oefşmşojedfş',
        'profileImage': 'assets/profile3.jpg',
        'status': 'fmeşmşd'
      },
    ];

    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return FriendCard(friend: friends[index]);
      },
    );
  }
}
