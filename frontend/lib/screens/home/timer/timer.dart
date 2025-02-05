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
  bool _isPaused = false; // Ara verildiğinde kontrol etmek için
  int _hours = 0, _minutes = 0, _seconds = 0;
  final List<Map<String, String>> _savedTimers = [];

  void _startTimer() {
    setState(() {
      _totalSeconds = _hours * 3600 + _minutes * 60 + _seconds;
      _secondsRemaining = _totalSeconds;
      _isRunning = true;
      _isPaused = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _stopTimer();
          _showCompletionDialog(); // Süre bittiğinde otomatik kaydet
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _stopTimer();
          _showCompletionDialog(); // Süre bittiğinde otomatik kaydet
        }
      });
    });
    setState(() {
      _isPaused = false;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 0;
      _isRunning = false;
      _isPaused = false;
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
    });
  }

  void _showCompletionDialog() async {
    // Süre bittiğinde otomatik kaydet
    final name = await _saveTimeWithName(context);

    if (name != null && name.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Zamanlayıcı Tamamlandı'),
            content: Text('"$name" adıyla kaydedildi.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    } else {
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
  }

  Future<String?> _saveTimeWithName(BuildContext context) async {
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

    return name;
  }

  void _stopAndSaveTimer(BuildContext context) {
    _stopTimer();
    _saveTimeWithName(context);
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
                  onPause: _pauseTimer,
                  onResume: _resumeTimer,
                  onStop: () => _stopAndSaveTimer(
                      context), // Bitir butonu hem durdurur hem kaydeder
                  isPaused: _isPaused,
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
          TimerList(savedTimers: _savedTimers),
        ],
      ),
    );
  }
}
