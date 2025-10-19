import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// WeatherModel? weatherModel; // global variable عشان اقدر اوصلها من اي مكان في ال app بتاعي
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 3,
        // shadowColor: Colors.black.withValues(
        //   alpha: 1,
        //   red: 0,
        //   green: 0,
        //   blue: 0,
        // ),
        // backgroundColor: Colors.blue,
        title: const Text("Search City"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          // color: Colors.white,
          size: 30,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              border: OutlineInputBorder(),
              labelText: "Search",
              hintText: "Enter City Name...",
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) async {
              // sex step is (trigger cubit) : to call the Cubit function to fetch weather data when user submits a city name
              GetWeatherCubit getWeatherCubit =
                  // access the Cubit instance using BlocProvider
                  BlocProvider.of<GetWeatherCubit>(context);
              await getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
