/*
lib/
├── main.dart
├── core/         # ثوابت و Utilities
├── features/
│   ├── auth/     # تسجيل الدخول
│   ├── weather/  # الطقس
│   ├── favorites/
│   └── settings/
├── services/     # API, Firebase
└── widgets/
--------------------------- ###### -------------------------------
📝 شرح الملفات :
main.dart → نقطة البداية + routes.

screens/
splash_screen.dart → شاشة البداية.
home_screen.dart → البحث عن المدينة + عرض الطقس.
weather_details_screen.dart → تفاصيل أكتر (درجة الحرارة، سرعة الرياح...).
favorites_screen.dart → قائمة المفضلات.

widgets/
weather_card.dart → كارت يعرض بيانات الطقس (أيقونة + درجة الحرارة).
city_input.dart → TextField لإدخال المدينة.

services/
weather_service.dart → فيه الكود الخاص بالـ APIs (geocoding + الطقس).
--------------------------- ###### -------------------------------
*/


import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/weather_details_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/details': (context) => const WeatherDetailsScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}

