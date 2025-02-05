import 'package:flutter/material.dart';
import 'profile_status.dart'; // ProfileStatus dosyasını import et
import 'friends/profile_friends.dart'; // ProfileFriends dosyasını import et
import 'task_list.dart';
import 'study_sessions_list.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  int _selectedIndex = 0; // Tab bar için seçili indeks
  List<Map<String, dynamic>> tasks = [];
  List<Map<String, dynamic>> studySessions = [];

  void _addTask(String task) {
    setState(() {
      tasks.add({'task': task, 'completed': false});
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void _addStudySession(String subject, int hours) {
    setState(() {
      studySessions.add({'subject': subject, 'hours': hours});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Burada SingleChildScrollView widget'ı ekleniyor
      child: Column(
        children: [
          const ProfileFriends(), // Arkadaşlar kısmı
          const ProfileStatus(), // Durum kısmı
          const SizedBox(height: 20),
          // Tab Bar
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(text: 'Yapılacaklar'),
                    Tab(text: 'Ne Kadar Çalıştım?'),
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                const SizedBox(height: 10),
                // Tab Bar İçeriği
                _selectedIndex == 0
                    ? TasksList(
                        tasks: tasks,
                        onTaskToggle: _toggleTaskCompletion,
                        onTaskAdd: _addTask,
                      )
                    : StudySessionsList(
                        studySessions: studySessions,
                        onStudySessionAdd: _addStudySession,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
