//  تفاصيل أكتر (درجة الحرارة، سرعة الرياح...)

import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> weatherData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل الطقس - ${weatherData['city']}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("درجة الحرارة: ${weatherData['temperature']} °C", style: const TextStyle(fontSize: 20)),
            Text("سرعة الرياح: ${weatherData['windspeed']} km/h", style: const TextStyle(fontSize: 20)),
            Text("اتجاه الرياح: ${weatherData['winddirection']}°", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
