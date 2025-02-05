import 'package:flutter/material.dart';
import 'community/community_screen.dart';
import 'groups/groups_screen.dart';
import 'profile/profile_screen.dart';
import 'timer/timer_screen.dart';
import 'settings/settings_screen.dart'; // Ayarlar sayfasını ekledik

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Başlangıçta Profil ekranı seçili olacak

  final List<Widget> _screens = [
    const ProfileScreen(), // Profil ekranı
    const CommunityScreen(), // Topluluk ekranı
    const GroupScreen(), // Gruplar ekranı
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
      body: Stack(
        children: [
          _screens[_currentIndex], // Seçilen ekranı göster
          Positioned(
            top: 10.0, // Konumu ayarlayın
            right: 10.0, // Konumu ayarlayın
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.purple,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: const Drawer(
        child: SettingsScreen(), // Ayarlar ekranı
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor:
            const Color.fromARGB(255, 214, 172, 208), // Arka plan rengi
        selectedItemColor: Colors.white, // Seçili öğe rengi
        unselectedItemColor:
            const Color.fromRGBO(255, 255, 255, 0.6), // Opaklık uygulaması
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Topluluk', // Etiket güncellendi
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
