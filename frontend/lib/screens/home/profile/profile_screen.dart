import 'package:flutter/material.dart';
import '../flowpanel/flowpanel_screen.dart';
import 'profile_content.dart'; // ProfileContent dosyasını import et

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        reverse: true, // Sola kaydırma için reverse parametresini ekliyoruz
        children: [
          const ProfileContent(), // Profil İçeriği
          const FlowScreen(), // Briefing tarzı kayan ekran içeriği
        ],
      ),
    );
  }
}

// Yapılacaklar ve ne kadar çalıştım yerini bi tablo içine al ve artıyı daha estetik olucak bi şekilde koy
//yapılacaklar ve tarih o şekil absürt duruyo güzel bi tablo şekliyle güzelleştir
