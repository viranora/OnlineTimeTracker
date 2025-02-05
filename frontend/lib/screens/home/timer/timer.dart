import 'package:flutter/material.dart';
import 'dart:async';
import 'progress_display.dart';
import 'time_input.dart';
import 'timer_list.dart'; // Yeni liste ekranı import edildi

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _secondsRemaining = 0;
  int _totalSeconds = 0;
  Timer? _timer;
  bool _isRunning = false;
  int _hours = 0, _minutes = 0, _seconds = 0;
  final List<Map<String, String>> _savedTimers =
      []; // Kaydedilen süreler listesi

  void _startTimer() {
    setState(() {
      _totalSeconds = _hours * 3600 + _minutes * 60 + _seconds;
      _secondsRemaining = _totalSeconds;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _stopTimer();
          _showCompletionDialog();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 0;
      _isRunning = false;
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Zamanlayıcı Tamamlandı'),
          content: const Text('Belirlediğiniz süre doldu.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  void _saveTimeWithName(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Süreyi Kaydet'),
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
        _savedTimers.add({'name': name, 'time': _formatTime(_totalSeconds)});
      });
    }
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_isRunning)
            Column(
              children: [
                ProgressDisplay(
                  secondsRemaining: _secondsRemaining,
                  totalSeconds: _totalSeconds,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text("Sıfırla"),
                ),
              ],
            )
          else
            Column(
              children: [
                TimeInput(
                  hours: _hours,
                  minutes: _minutes,
                  seconds: _seconds,
                  onTimeChanged: (h, m, s) {
                    setState(() {
                      _hours = h;
                      _minutes = m;
                      _seconds = s;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text("Başlat"),
                ),
              ],
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _saveTimeWithName(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Süreyi Kaydet', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 20),
          TimerList(savedTimers: _savedTimers),
        ],
      ),
    );
  }
}
