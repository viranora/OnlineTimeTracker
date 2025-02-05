import 'package:flutter/material.dart';
import 'profile_status.dart'; // ProfileStatus dosyasını import et
import 'friends/profile_friends.dart'; // ProfileFriends dosyasını import et
import 'scoreboard.dart';
import 'task_list.dart'; // TasksList bileşenini import et

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  List<Map<String, dynamic>> tasks = [];

  void _addTask(Map<String, dynamic> task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileFriends(), // Arkadaşlar kısmı
          const ProfileStatus(), // Durum kısmı
          const SizedBox(height: 20),
          // Tab Bar ve TabBarView yapısının iyileştirilmesi
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorWeight: 3.0, // Daha belirgin bir tab indicator
                  indicatorColor: Colors.blue, // Aktif sekme indikatörü rengi
                  tabs: [
                    Tab(text: 'Yapılacaklar'),
                    Tab(text: 'Puan Tablosu'),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 500, // İçeriğe uygun yükseklik
                  child: TabBarView(
                    children: [
                      TasksList(
                        tasks: tasks,
                        onTaskToggle: _toggleTaskCompletion,
                        onTaskAdd: _addTask, // Yeni task'ı buraya ekliyoruz
                      ),
                      const Scoreboard(), // Puan Tablosu
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
