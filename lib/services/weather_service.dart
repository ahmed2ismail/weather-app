import 'dart:developer';

import 'package:advanced_weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  //*************** */ Bade code *************
  // It's better to not hardcode the base URL and API key.
  // Consider using environment variables for them.
  final String _baseUrl = "https://api.weatherapi.com/v1";
  final String _apiKey =
      "75b1132ba8b94bf3830134646251310"; // TODO: Move to environment variables
  //************** */ Bade code ************* 
  //################ Good code ############
  // Use environment variables to store sensitive information like API keys.
  final Dio dio;
  // final String _baseUrl = dotenv.env['BASE_URL']!; // environment variables;
  // final String _apiKey = dotenv.env['API_KEY']! ; // environment variables

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // Handle Dio-specific errors (e.g., network issues, timeouts, 4xx/5xx responses)
      final String errorMessage =
          e.response?.data['error']['message'] ??
          "Oops, there was an error. Please try again later.";
      throw Exception(errorMessage);
    } catch (e) {
      // Handle any other errors
      log("ErrorMessage: ${e.toString()}");
      throw Exception("An unexpected error occurred. Please try again later.");
    }
  }
}
