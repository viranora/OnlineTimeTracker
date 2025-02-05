import 'package:flutter/material.dart';

class ProgressDisplay extends StatelessWidget {
  final int secondsRemaining;

  const ProgressDisplay(
      {super.key, required this.secondsRemaining, required int totalSeconds});

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: secondsRemaining > 0 ? _calculateProgress() : 0.0,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        Text(
          _formatTime(secondsRemaining),
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }

  double _calculateProgress() {
    // Toplam süreyi burada belirlemeniz gerekebilir
    int totalSeconds = 3600; // Örneğin, 1 saatlik bir zamanlayıcı için
    return (totalSeconds - secondsRemaining) / totalSeconds;
  }
}
