import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(int) onTaskToggle;
  final Function(Map<String, dynamic>) onTaskAdd;

  const TasksList({
    super.key,
    required this.tasks,
    required this.onTaskToggle,
    required this.onTaskAdd,
  });

  Future<Map<String, dynamic>?> _showAddTaskDialog(BuildContext context) async {
    TextEditingController taskController = TextEditingController();
    DateTime? startDate;
    DateTime? endDate;

    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni Etkinlik',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                    hintText: 'Etkinlik adı',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                ),
                const SizedBox(height: 12),
                _buildDatePickerRow(context, 'Başlangıç', startDate,
                    (selectedDate) {
                  startDate = selectedDate;
                }),
                const SizedBox(height: 12),
                _buildDatePickerRow(context, 'Bitiş', endDate, (selectedDate) {
                  endDate = selectedDate;
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('İptal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty &&
                    startDate != null &&
                    endDate != null) {
                  Navigator.of(context).pop({
                    'task': taskController.text,
                    'start_date': startDate!.toLocal().toString().split(' ')[0],
                    'end_date': endDate!.toLocal().toString().split(' ')[0],
                    'completed': false,
                  });
                }
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  Row _buildDatePickerRow(BuildContext context, String label,
      DateTime? selectedDate, Function(DateTime?) onDateSelected) {
    return Row(
      children: [
        Expanded(
          child: Text(
            selectedDate == null
                ? '$label Tarihi Seçin'
                : '$label: ${selectedDate.toLocal().toString().split(' ')[0]}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today, size: 20, color: Colors.blue),
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              onDateSelected(date);
              (context as Element).markNeedsBuild(); // Rebuild dialog
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            ...tasks.map((task) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Checkbox(
                    value: task['completed'],
                    onChanged: (_) => onTaskToggle(tasks.indexOf(task)),
                    activeColor: Colors.green,
                  ),
                  title: Text(
                    task['task'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration:
                          task['completed'] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    'Başlangıç: ${task['start_date']} - Bitiş: ${task['end_date']}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
        // FloatingActionButton'u daha modern ve ilgi çekici hale getirme
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () async {
              final task = await _showAddTaskDialog(context);
              if (task != null) {
                onTaskAdd(task); // Yeni task'ı ekle
              }
            },
            child: const Icon(Icons.add, size: 32, color: Colors.white),
            backgroundColor: Colors.blue,
            elevation: 8, // Gölge efekti
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Köşeleri yuvarlak
            ),
          ),
        ),
      ],
    );
  }
}
