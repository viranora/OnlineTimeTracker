import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final Function(int, int, int) onTimeChanged;

  const TimeInput({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimePicker('Saat', hours, 24,
                    (value) => onTimeChanged(value, minutes, seconds)),
                _buildTimePicker('Dakika', minutes, 60,
                    (value) => onTimeChanged(hours, value, seconds)),
                _buildTimePicker('Saniye', seconds, 60,
                    (value) => onTimeChanged(hours, minutes, value)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimePicker(String label, int initialValue, int maxValue,
      Function(int) onSelectedItemChanged) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 150,
          width: 60,
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: initialValue),
            itemExtent: 40,
            onSelectedItemChanged: onSelectedItemChanged,
            children: List<Widget>.generate(maxValue, (int index) {
              return Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
