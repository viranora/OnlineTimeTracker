import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Profil ekranı
import 'friends_screen.dart'; // Arkadaşlar ekranı
import 'groups_screen.dart'; // Gruplar ekranı
import 'timer_screen.dart'; // Timer ekranı

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Başlangıçta Profil ekranı seçili olacak

  final List<Widget> _screens = [
    const ProfileScreen(), // Profil ekranı
    const FriendsScreen(), // Arkadaşlar ekranı
    const GroupsScreen(), // Gruplar ekranı
    const TimerScreen(), // Timer ekranı
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Seçilen sekmeye göre ekranı değiştir
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
      ),
      body: _screens[_currentIndex], // Seçilen ekranı göster
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue, // Arka plan rengi
        selectedItemColor: Colors.white, // Seçili öğe rengi
        unselectedItemColor:
            Color.fromRGBO(255, 255, 255, 0.6), // Opaklık uygulaması
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Arkadaşlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Gruplar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
      ),
    );
  }
}
