import 'package:flutter/material.dart';
import 'screens/auto/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Time Tracker',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 160, 131, 157)),
      debugShowCheckedModeBanner: false, //debug bannerı kaldır
      home: const LoginScreen(), // İlk açılacak sayfa giriş ekranı olacak
    );
  }
}
