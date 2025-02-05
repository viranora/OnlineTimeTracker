import 'package:flutter/material.dart';

class StudySessionsList extends StatelessWidget {
  final List<Map<String, dynamic>> studySessions;
  final Function(String, int) onStudySessionAdd;

  const StudySessionsList(
      {super.key,
      required this.studySessions,
      required this.onStudySessionAdd});

  Future<Map<String, dynamic>?> _showAddStudySessionDialog(
      BuildContext context) async {
    TextEditingController subjectController = TextEditingController();
    TextEditingController hoursController = TextEditingController();
    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni Çalışma Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: subjectController,
                  decoration: const InputDecoration(hintText: 'Ders adı'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: hoursController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Süre (saat)'),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('İptal')),
            TextButton(
              onPressed: () => Navigator.of(context).pop({
                'subject': subjectController.text,
                'hours': int.tryParse(hoursController.text) ?? 0
              }),
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.add_circle, size: 36, color: Colors.blue),
            onPressed: () async {
              final session = await _showAddStudySessionDialog(context);
              if (session != null) {
                onStudySessionAdd(session['subject'], session['hours']);
              }
            },
          ),
        ),
        ...studySessions.map((session) => ListTile(
              title: Text(session['subject']),
              subtitle: Text('${session['hours']} saat'),
            )),
      ],
    );
  }
}
