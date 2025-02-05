import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hesap Ayarları',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple, // Başlık arka plan rengi
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Şifre Değiştir'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Eposta Değiştir'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Kullanıcı Adı Değiştir'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Hesabı Sil'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
