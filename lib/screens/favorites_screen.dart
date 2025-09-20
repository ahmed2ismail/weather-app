// قائمة المفضلات

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
    });
  }

  Future<void> removeFavorite(String city) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites.remove(city);
      prefs.setStringList('favorites', favorites);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المفضلات")),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final city = favorites[index];
          return ListTile(
            title: Text(city),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeFavorite(city),
            ),
          );
        },
      ),
    );
  }
}