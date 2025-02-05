import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final int friendsCount;
  final VoidCallback onFriendsTap;

  const ProfileHeader({
    super.key,
    required this.friendsCount,
    required this.onFriendsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Profil',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: onFriendsTap,
              child: Column(
                children: [
                  Text(
                    '$friendsCount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Arkadaşlar',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Kullanıcı Adı',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
