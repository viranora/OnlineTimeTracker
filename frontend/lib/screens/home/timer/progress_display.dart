import 'package:flutter/material.dart';

class ProgressDisplay extends StatelessWidget {
  final int secondsRemaining;
  final int totalSeconds;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onStop;
  final bool isPaused;

  const ProgressDisplay({
    super.key,
    required this.secondsRemaining,
    required this.totalSeconds,
    required this.onPause,
    required this.onResume,
    required this.onStop,
    required this.isPaused,
  });

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isPaused)
                ElevatedButton(
                  onPressed: onPause,
                  child: const Text("Ara Ver"),
                )
              else
                ElevatedButton(
                  onPressed: onResume,
                  child: const Text("Arayı Bitir"),
                ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: onStop,
                child: const Text("Bitir"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculateProgress() {
    return totalSeconds > 0
        ? (totalSeconds - secondsRemaining) / totalSeconds
        : 0.0;
  }
}
