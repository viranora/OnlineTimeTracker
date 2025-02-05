import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  final String currentTheme;

  const ThemeScreen({super.key, required this.currentTheme});

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late String _currentTheme;

  @override
  void initState() {
    super.initState();
    _currentTheme = widget.currentTheme;
  }

  void _updateTheme(String theme) {
    setState(() {
      _currentTheme = theme;
    });
    Navigator.pop(context, theme); // Seçili temayı geri döndürüyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema Değiştir'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(
              Icons.wb_sunny,
              color: _currentTheme == 'Light' ? Colors.yellow : Colors.yellow,
            ),
            title: const Text('Light Mode'),
            trailing: _currentTheme == 'Light'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () => _updateTheme('Light'),
          ),
          ListTile(
            leading: Icon(
              Icons.nights_stay,
              color: _currentTheme == 'Dark' ? Colors.grey : Colors.grey,
            ),
            title: const Text('Dark Mode'),
            trailing: _currentTheme == 'Dark'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () => _updateTheme('Dark'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: _currentTheme == 'System' ? Colors.blue : Colors.blue,
            ),
            title: const Text('System Default'),
            trailing: _currentTheme == 'System'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () => _updateTheme('System'),
          ),
        ],
      ),
    );
  }
}
