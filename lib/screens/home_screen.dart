// البحث عن المدينة + عرض الطقس

import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';
import '../widgets/city_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? weatherData;

  void searchCity(String city) async {
    final data = await WeatherService.fetchWeather(city);
    setState(() {
      weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
        ],
      ),
      body: Column(
        children: [
          CityInput(onSubmitted: searchCity),
          if (weatherData != null)
            WeatherCard(weatherData: weatherData!)
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("ابحث عن مدينة لعرض الطقس"),
            )
        ],
      ),
    );
  }
}
