import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tarih formatı için gerekli kütüphane
import 'date_picker.dart'; // DatePicker widget'ını import edin

class ProfileStatus extends StatefulWidget {
  const ProfileStatus({super.key});

  @override
  State<ProfileStatus> createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
  DateTime currentDate = DateTime.now();
  String status = "Durumunuzu güncellemek için tıklayın...";

  void _previousDay() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 1));
    });
  }

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

  // Modern ve şık tarih formatı
  String getFormattedDate() {
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(currentDate);
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: _previousDay,
              ),
              DatePicker(
                initialDate: currentDate,
                onDateSelected: (newDate) {
                  setState(() {
                    currentDate = newDate;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: _nextDay,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
