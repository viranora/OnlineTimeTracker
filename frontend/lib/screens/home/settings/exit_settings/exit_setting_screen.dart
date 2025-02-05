import 'package:flutter/material.dart';
import '../../../auto/login_screen.dart';

void logout(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}
