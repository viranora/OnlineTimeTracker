import 'package:flutter/material.dart';

class GroupChat extends StatefulWidget {
  final String groupName;

  const GroupChat({super.key, required this.groupName});

  @override
  State<GroupChat> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChat> {
  final List<String> messages = []; // Mesaj listesi
  final TextEditingController _controller =
      TextEditingController(); // Mesaj giriş alanı için controller

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear(); // Mesaj gönderildikten sonra temizle
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.groupName} Sohbeti')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerLeft, // Mesajları sola hizala
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(messages[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(hintText: 'Mesajınızı yazın...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage, // Butona basınca mesaj gönder
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
