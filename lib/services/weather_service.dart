// فيه الكود الخاص بالـ APIs (geocoding + الطقس)

import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<Map<String, dynamic>?> fetchWeather(String city) async {
    // API لتحويل المدينة إلى إحداثيات
    final geoUrl = Uri.parse(
        "https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1");
    final geoRes = await http.get(geoUrl);

    if (geoRes.statusCode == 200) {
      final geoData = json.decode(geoRes.body);
      if (geoData["results"] != null && geoData["results"].isNotEmpty) {
        final lat = geoData["results"][0]["latitude"];
        final lon = geoData["results"][0]["longitude"];
        final cityName = geoData["results"][0]["name"];

        final weatherUrl = Uri.parse(
            "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true");
        final weatherRes = await http.get(weatherUrl);

        if (weatherRes.statusCode == 200) {
          final weatherData = json.decode(weatherRes.body)["current_weather"];
          return {
            "city": cityName,
            "temperature": weatherData["temperature"],
            "windspeed": weatherData["windspeed"],
            "winddirection": weatherData["winddirection"],
          };
        }
      }
    }
    return null;
  }
}
