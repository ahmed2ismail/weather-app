// كارت يعرض بيانات الطقس (أيقونة + درجة الحرارة)

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherCard({super.key, required this.weatherData});

  Future<void> saveToFavorites(String city) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(city)) {
      favorites.add(city);
      prefs.setStringList('favorites', favorites);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: const Icon(Icons.cloud, size: 40),
        title: Text("${weatherData['city']} - ${weatherData['temperature']}°C"),
        subtitle: Text("سرعة الرياح: ${weatherData['windspeed']} km/h"),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => saveToFavorites(weatherData['city']),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/details', arguments: weatherData);
        },
      ),
    );
  }
}
