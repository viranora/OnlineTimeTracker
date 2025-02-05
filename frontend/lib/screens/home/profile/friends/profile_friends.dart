import 'package:flutter/material.dart';
import 'friends_screen.dart';
import '../profile_header.dart';

class ProfileFriends extends StatelessWidget {
  const ProfileFriends({super.key});

  void _navigateToFriendsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const FriendsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileHeader(
      friendsCount: 120,
      onFriendsTap: () => _navigateToFriendsScreen(context),
    );
  }
}
