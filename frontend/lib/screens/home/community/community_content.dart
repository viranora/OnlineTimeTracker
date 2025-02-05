import 'package:flutter/material.dart';

class CommunityContent extends StatelessWidget {
  const CommunityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trendler',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildTrendItem(context, 'Yeni Çıkan Teknolojiler', 'Teknoloji'),
        _buildTrendItem(context, 'Sağlıklı Yaşam Tüyoları', 'Sağlık'),
        _buildTrendItem(context, 'Seyahat Rehberi 2025', 'Seyahat'),
        const SizedBox(height: 20),
        const Text(
          'Öneriler',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildRecommendationItem(context, 'Yapay Zeka Kursları', 'Eğitim'),
        _buildRecommendationItem(context, 'En İyi Kitaplar', 'Eğitim'),
        _buildRecommendationItem(context, 'Fotoğrafçılık İpuçları', 'Hobi'),
      ],
    );
  }

  Widget _buildTrendItem(BuildContext context, String title, String category) {
    return ListTile(
      leading: const Icon(Icons.trending_up),
      title: Text(title),
      subtitle: Text(category),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title detayları burada.')),
        );
      },
    );
  }

  Widget _buildRecommendationItem(
      BuildContext context, String title, String category) {
    return ListTile(
      leading: const Icon(Icons.recommend),
      title: Text(title),
      subtitle: Text(category),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title detayları burada.')),
        );
      },
    );
  }
}
