import 'package:flutter/material.dart';
import 'community_content.dart'; // Topluluk içeriğini import et

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allUsers = [
    'Sarah',
    'Samuel',
    'Sandra',
    'Sophie',
    'Stephen'
  ]; // Örnek kullanıcı listesi
  List<String> _filteredUsers = [];

  void _filterUsers(String query) {
    setState(() {
      _filteredUsers = _allUsers
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topluluk'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'İnsanları Keşfet',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) => _filterUsers(query),
              ),
              const SizedBox(height: 20),
              if (_searchController.text.isNotEmpty && _filteredUsers.isEmpty)
                const Center(child: Text('Kullanıcı bulunamadı'))
              else if (_filteredUsers.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(_filteredUsers[index]),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Arkadaş ekleme işlemi burada yapılır
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('${_filteredUsers[index]} eklendi!'),
                            ),
                          );
                        },
                        child: const Text('Ekle'),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 20),
              const CommunityContent(), // Topluluk içeriğini ekledik
            ],
          ),
        ),
      ),
    );
  }
}
