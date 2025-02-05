import 'package:flutter/material.dart';
import '../profile/profile_content.dart'; // ProfileContent dosyasını import et

class FlowPanel extends StatefulWidget {
  const FlowPanel({super.key});

  @override
  _FlowPanelState createState() => _FlowPanelState();
}

class _FlowPanelState extends State<FlowPanel>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowPanel Başlığı'),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              }
            },
            child:
                const ProfileContent(), // ProfileContent'i burada çağırıyoruz
          ),
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Güncellenen İçerikler',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(title: Text('Meditasyon Müzikleri')),
                        ListTile(title: Text('Blog Yazıları')),
                        ListTile(title: Text('Günlük Makaleler')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
