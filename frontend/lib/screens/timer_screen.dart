import 'package:flutter/material.dart';
import 'dart:async';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  Timer? _timer; // Timer'ı nullable yapıyoruz
  bool _isTimerRunning = false;

  // Timer başlatma
  void _startTimer() {
    if (!_isTimerRunning) {
      // Eğer timer çalışmıyorsa, başlat
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
      setState(() {
        _isTimerRunning = true;
      });
    }
  }

  // Timer durdurma
  void _stopTimer() {
    _timer?.cancel(); // Null safety kullanarak _timer'ı durduruyoruz
    setState(() {
      _isTimerRunning = false;
    });
  }

  // Timer sıfırlama
  void _resetTimer() {
    _timer?.cancel(); // Timer'ı sıfırlıyoruz
    setState(() {
      _seconds = 0;
      _isTimerRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı dispose esnasında düzgün şekilde durduruyoruz
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zamanlayıcı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Geçen Süre: ${_seconds}s',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Başlat'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: const Text('Durdur'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Sıfırla'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
