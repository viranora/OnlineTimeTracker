import 'package:flutter/material.dart';
import 'account_settings/account_settings_screen.dart';
import 'exit_settings/exit_setting_screen.dart';
import 'general_settings/general_settings_screen.dart';
import 'notification_setting/notification_setting_screen.dart';
import 'privacy_setting/privacy_setting_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Hesap Ayarları'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Genel Ayarlar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GeneralSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('İstekler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NotificationScreen()), // NotificationScreen ekranına yönlendirme
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Gizlilik'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacySettingsScreen()),
              );
            },
          ),
          const Divider(), // Görsel olarak bölme çizgisi ekledik
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Çıkış Yap'),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }
}
