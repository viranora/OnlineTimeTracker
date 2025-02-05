import 'package:flutter/material.dart';

class FlowPanelContent extends StatelessWidget {
  const FlowPanelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                _buildCard(context, Colors.red, height: 150),
                _buildCard(context, Colors.green, height: 100),
                _buildCard(context, Colors.blue, height: 200),
              ],
            ),
            Row(
              children: [
                _buildCard(context, Colors.orange, height: 100),
                _buildCard(context, Colors.purple, height: 150),
                _buildCard(context, Colors.yellow, height: 120),
              ],
            ),
            Row(
              children: [
                _buildCard(context, Colors.cyan, height: 200),
                _buildCard(context, Colors.brown, height: 100),
                _buildCard(context, Colors.pink, height: 150),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Color color, {double height = 100}) {
    return Expanded(
      child: Container(
        height: height,
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'Kart İçeriği',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
