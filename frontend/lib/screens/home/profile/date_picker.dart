import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePicker({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(),
        child: Text(
          DateFormat('MM/dd/yyyy').format(initialDate), // Sadece tarih kısmı
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent, // Metin rengi
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                color: Colors.black26, // Gölge rengi
              ),
            ],
          ),
        ),
      ),
    );
  }
}
