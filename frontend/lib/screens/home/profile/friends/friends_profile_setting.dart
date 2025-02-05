import 'package:flutter/material.dart';

class FriendsProfileSettings extends StatelessWidget {
  const FriendsProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        switch (result) {
          case 'remove_friend':
            // Arkadaşlıktan çıkarma işlevi
            break;
          case 'block_user':
            // Kişiyi engelleme işlevi
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'remove_friend',
          child: Text('Arkadaşlıktan Çıkar'),
        ),
        const PopupMenuItem<String>(
          value: 'block_user',
          child: Text('Kişiyi Engelle'),
        ),
      ],
    );
  }
}
