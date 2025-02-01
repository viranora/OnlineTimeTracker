import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime currentDate = DateTime.now();
  List<Map<String, dynamic>> tasks = [];
  List<Map<String, dynamic>> studySessions = [];
  bool isShowingTasks = true;

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

  void _previousDay() {
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      currentDate = currentDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile section
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                            backgroundColor: Colors.grey[300],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                '120',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Arkadaşlar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Kullanıcı Adı',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'email@example.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                      // Günlük etkinlikler için tablo
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_left),
                              onPressed: _previousDay,
                            ),
                            Text(
                              '${currentDate.year}-${currentDate.month}-${currentDate.day}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_right),
                              onPressed: _nextDay,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Etkinlik ve Çalışma Seansı Seçimi
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isShowingTasks = true;
                                });
                              },
                              child: Text('Etkinlikler'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isShowingTasks = false;
                                });
                              },
                              child: Text('Çalışma Seansları'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Seçilen listeyi göster
                      isShowingTasks
                          ? _buildTasksList()
                          : _buildStudySessionsList(),
                      const SizedBox(height: 10),
                      const Divider(),
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Profil Bilgileri Buraya Eklenebilir',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Etkinlikler listesini gösteren fonksiyon
  Widget _buildTasksList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                'Günlük Etkinlikler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              // Artı butonu
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  // Yeni etkinlik ekleme
                  final task = await _showAddTaskDialog(context);
                  if (task != null && task.isNotEmpty) {
                    _addTask(task);
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Table(
            border: TableBorder.all(
              color: Colors.grey,
              width: 1,
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Durum',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Etkinlik Adı',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < tasks.length; i++)
                TableRow(
                  children: [
                    Checkbox(
                      value: tasks[i]['completed'],
                      onChanged: (bool? value) {
                        _toggleTaskCompletion(i);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tasks[i]['task'],
                        style: TextStyle(
                          decoration: tasks[i]['completed']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Çalışma seansları listesini gösteren fonksiyon
  Widget _buildStudySessionsList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Çalışılan Dersler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  final sessionData = await _showAddStudySessionDialog(context);
                  if (sessionData != null) {
                    _addStudySession(
                        sessionData['subject'], sessionData['hours']);
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Table(
            border: TableBorder.all(
              color: Colors.grey,
              width: 1,
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ders',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Çalışma Süresi (Saat)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < studySessions.length; i++)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(studySessions[i]['subject']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${studySessions[i]['hours']} saat'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Etkinlik ekleme için dialog
  Future<String?> _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Etkinlik'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Etkinlik adı'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(taskController.text);
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  // Çalışma seansı ekleme için dialog
  Future<Map<String, dynamic>?> _showAddStudySessionDialog(
      BuildContext context) {
    TextEditingController subjectController = TextEditingController();
    TextEditingController hoursController = TextEditingController();
    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Çalışma Seansı'),
          content: Column(
            children: [
              TextField(
                controller: subjectController,
                decoration: InputDecoration(hintText: 'Ders adı'),
              ),
              TextField(
                controller: hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Çalışma Süresi (Saat)'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                int hours = int.tryParse(hoursController.text) ?? 0;
                Navigator.of(context).pop({
                  'subject': subjectController.text,
                  'hours': hours,
                });
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}

/**
 * listelerden birini seçmek bi menü içinde olucak
 * tarih değiştikçe yenilencek
 * saatler kendi hesaplancak
 * kullanıcı adı ve mail alıncak
 * pp ekleme gelicek
 * çember istatistik
 * ekran kayma
 * şeffalık
 * geri çıkmayı kapat
 */
