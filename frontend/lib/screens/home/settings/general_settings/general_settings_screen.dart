import 'package:flutter/material.dart';
import 'theme_screen.dart'; // ThemeScreen dosyasını import et
import 'language_screen.dart'; // LanguageScreen dosyasını import et

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  _GeneralSettingsScreenState createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  String _currentTheme = 'Light';
  String _currentLanguage = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Genel Ayarlar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple, // Başlık arka plan rengi
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tema Değiştir'),
                Row(
                  children: [
                    Text(
                      _currentTheme,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      _currentTheme == 'Light'
                          ? Icons.wb_sunny
                          : _currentTheme == 'Dark'
                              ? Icons.nights_stay
                              : Icons.settings,
                      color: _currentTheme == 'Light'
                          ? Colors.yellow
                          : _currentTheme == 'Dark'
                              ? Colors.grey
                              : Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ThemeScreen(currentTheme: _currentTheme)),
              );
              if (result != null) {
                setState(() {
                  _currentTheme = result;
                });
              }
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dil Değiştir'),
                Row(
                  children: [
                    Text(
                      _currentLanguage,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.language, color: Colors.blue),
                  ],
                ),
              ],
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LanguageScreen(currentLanguage: _currentLanguage)),
              );
              if (result != null) {
                setState(() {
                  _currentLanguage = result;
                });
              }
            },
          ),
          // Diğer genel ayarlar buraya eklenebilir
        ],
      ),
    );
  }
}
