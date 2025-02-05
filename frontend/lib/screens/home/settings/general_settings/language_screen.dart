import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  final String currentLanguage;

  const LanguageScreen({super.key, required this.currentLanguage});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.currentLanguage;
  }

  void _updateLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
    Navigator.pop(context, language); // Seçili dili geri döndürüyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dil Değiştir'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(
              Icons.language,
              color: _currentLanguage == 'Türkçe' ? Colors.blue : Colors.blue,
            ),
            title: const Text('Türkçe'),
            trailing: _currentLanguage == 'Türkçe'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () => _updateLanguage('Türkçe'),
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: _currentLanguage == 'English' ? Colors.blue : Colors.blue,
            ),
            title: const Text('English'),
            trailing: _currentLanguage == 'English'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () => _updateLanguage('English'),
          ),
        ],
      ),
    );
  }
}
