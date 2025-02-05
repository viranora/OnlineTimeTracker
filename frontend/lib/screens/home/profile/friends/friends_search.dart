import 'package:flutter/material.dart';

class FriendsSearch extends StatelessWidget {
  const FriendsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Kullanıcı adı ile arkadaş ara',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          // Arama işlevi burada uygulanabilir
        },
      ),
    );
  }
}
