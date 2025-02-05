import 'package:flutter/material.dart';
import 'dart:async';
import 'stopwatch_list.dart'; // StopwatchList dosyasını import et

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _timeElapsed = '00:00:00';
  final List<Map<String, String>> _savedTimes = [];

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _timeElapsed = _formatTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {
      _timeElapsed = '00:00:00';
    });
  }

  String _formatTime(int milliseconds) {
    int hours = (milliseconds ~/ 3600000);
    int minutes = (milliseconds % 3600000) ~/ 60000;
    int seconds = (milliseconds % 60000) ~/ 1000;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _saveTimeWithName(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Zamanı Kaydet'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'İsim girin',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Kaydet'),
              onPressed: () {
                Navigator.of(context).pop(nameController.text);
              },
            ),
          ],
        );
      },
    );

    if (name != null && name.isNotEmpty) {
      setState(() {
        _savedTimes.add({'name': name, 'time': _timeElapsed});
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _timeElapsed,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startStopwatch,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Başlat', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _stopStopwatch,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Durdur', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _resetStopwatch,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Sıfırla', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _saveTimeWithName(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Zamanı Kaydet', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 20),
        StopwatchList(savedTimes: _savedTimes),
      ],
    );
  }
}
