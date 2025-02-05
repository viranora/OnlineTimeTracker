import 'package:flutter/material.dart';

class ProfileStatus extends StatefulWidget {
  const ProfileStatus({super.key});

  @override
  State<ProfileStatus> createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
  String status = "Durumunuzu güncellemek için tıklayın...";

  // Durum için
  void _updateStatus() async {
    String newStatus = await _showUpdateStatusDialog(context);
    if (newStatus.isNotEmpty) {
      setState(() {
        status = newStatus;
      });
    }
  }

  Future<String> _showUpdateStatusDialog(BuildContext context) async {
    TextEditingController _statusController = TextEditingController();
    return await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Durum Güncelle'),
              content: TextField(
                controller: _statusController,
                decoration: const InputDecoration(
                  hintText: 'Yeni durumunuzu yazın',
                  border: OutlineInputBorder(),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('İptal'),
                  onPressed: () {
                    Navigator.of(context).pop("");
                  },
                ),
                TextButton(
                  child: const Text('Güncelle'),
                  onPressed: () {
                    Navigator.of(context).pop(_statusController.text);
                  },
                ),
              ],
            );
          },
        ) ??
        "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _updateStatus,
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
