import 'package:flutter/material.dart';
import 'timer.dart'; // TimerWidget'ı import et
import 'stopwatch.dart'; // StopwatchWidget'ı import et

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'Zamanlayıcı'; // Başlangıçta gösterilecek değer
  bool isDropdownOpen =
      false; // Dropdown menüsünün açık olup olmadığını kontrol ederiz
  Widget currentScreen =
      const TimerWidget(); // Başlangıçta Zamanlayıcı ekranı gösterilecek
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
      if (isDropdownOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zamanlayıcı ve Kronometre'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: toggleDropdown,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dropdownValue,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        isDropdownOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: currentScreen, // Seçilen ekranı burada gösteriyoruz
              ),
            ],
          ),
          if (isDropdownOpen)
            Positioned(
              top: MediaQuery.of(context).size.height *
                  0.1, // Başlığın hemen altında açılmasını sağlıyoruz
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2,
              child: SizeTransition(
                sizeFactor: _heightFactor,
                axisAlignment: -1.0, // Üst tarafa doğru açılması için
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Zamanlayıcı',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          setState(() {
                            dropdownValue = 'Zamanlayıcı';
                            isDropdownOpen = false;
                            currentScreen =
                                const TimerWidget(); // Zamanlayıcıyı göster
                            _controller.reverse();
                          });
                        },
                      ),
                      const Divider(height: 1),
                      ListTile(
                        title: const Text(
                          'Kronometre',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          setState(() {
                            dropdownValue = 'Kronometre';
                            isDropdownOpen = false;
                            currentScreen =
                                const StopwatchWidget(); // Kronometreyi göster
                            _controller.reverse();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
