import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(int) onTaskToggle;
  final Function(String) onTaskAdd;

  const TasksList(
      {super.key,
      required this.tasks,
      required this.onTaskToggle,
      required this.onTaskAdd});

  Future<String?> _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni Etkinlik'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Etkinlik adı'),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('İptal')),
            TextButton(
                onPressed: () => Navigator.of(context).pop(taskController.text),
                child: const Text('Ekle')),
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
              final task = await _showAddTaskDialog(context);
              if (task != null && task.isNotEmpty) {
                onTaskAdd(task);
              }
            },
          ),
        ),
        ...tasks.map((task) => ListTile(
              leading: Checkbox(
                  value: task['completed'],
                  onChanged: (_) => onTaskToggle(tasks.indexOf(task))),
              title: Text(
                task['task'],
                style: TextStyle(
                  decoration:
                      task['completed'] ? TextDecoration.lineThrough : null,
                ),
              ),
            )),
      ],
    );
  }
}
