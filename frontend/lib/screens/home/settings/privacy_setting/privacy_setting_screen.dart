import 'package:flutter/material.dart';
import 'blocked_users_screen.dart'; // BlockedUsersScreen dosyasını import et

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _isOnlineVisible = true;
  bool _lastSeenVisible = true;
  String _profilePhotoVisibility = 'Herkes';
  String _statusVisibility = 'Herkes';
  List<String> _blockedUsers = [];
  String _messageReceiveSetting = 'Herkes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gizlilik Ayarları'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Çevrimiçi Durumu Göster'),
            value: _isOnlineVisible,
            onChanged: (bool value) {
              setState(() {
                _isOnlineVisible = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Son Görülme Açık'),
            value: _lastSeenVisible,
            onChanged: (bool value) {
              setState(() {
                _lastSeenVisible = value;
              });
            },
          ),
          ListTile(
            title: const Text('Profil Fotoğrafını Kimler Görebilir?'),
            subtitle: Text(_profilePhotoVisibility),
            onTap: _showProfilePhotoVisibilityDialog,
          ),
          ListTile(
            title: const Text('Durum Paylaşımlarını Kimler Görebilir?'),
            subtitle: Text(_statusVisibility),
            onTap: _showStatusVisibilityDialog,
          ),
          ListTile(
            title: const Text('Engellenen Kullanıcılar Listesi'),
            subtitle: Text(_blockedUsers.isEmpty
                ? 'Hiçbir kullanıcı engellenmemiş.'
                : _blockedUsers.join(', ')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BlockedUsersScreen(blockedUsers: _blockedUsers),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Mesaj Almayı Sınırla'),
            subtitle: Text(_messageReceiveSetting),
            onTap: _showMessageReceiveSettingDialog,
          ),
        ],
      ),
    );
  }

  void _showProfilePhotoVisibilityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profil Fotoğrafını Kimler Görebilir?'),
          content: SingleChildScrollView(
            child: Column(
              children:
                  ['Herkes', 'Sadece Arkadaşlar', 'Gizli'].map((String option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _profilePhotoVisibility,
                  onChanged: (String? value) {
                    setState(() {
                      _profilePhotoVisibility = value ?? 'Herkes';
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showStatusVisibilityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Durum Paylaşımlarını Kimler Görebilir?'),
          content: SingleChildScrollView(
            child: Column(
              children:
                  ['Herkes', 'Sadece Arkadaşlar', 'Gizli'].map((String option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _statusVisibility,
                  onChanged: (String? value) {
                    setState(() {
                      _statusVisibility = value ?? 'Herkes';
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showMessageReceiveSettingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mesaj Almayı Sınırla'),
          content: SingleChildScrollView(
            child: Column(
              children: ['Herkes', 'Sadece Arkadaşlar'].map((String option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _messageReceiveSetting,
                  onChanged: (String? value) {
                    setState(() {
                      _messageReceiveSetting = value ?? 'Herkes';
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
