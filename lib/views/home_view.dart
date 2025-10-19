import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:advanced_weather_app/main.dart';
import 'package:advanced_weather_app/views/search_view.dart';
import 'package:advanced_weather_app/widgets/no_weather_body.dart';
import 'package:advanced_weather_app/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 3,
            shadowColor: Colors.black.withValues(
              alpha: 1,
              red: 0,
              green: 0,
              blue: 0,
            ),
            title: const Text("Weather App"),
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              // color: Colors.white,
            ),
            backgroundColor: getThemeColor(
              condition: BlocProvider.of<GetWeatherCubit>(
                context,
              ).weatherModel?.weatherCondition,
            ),
            iconTheme: const IconThemeData(color: Colors.white, size: 30),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          // body: weatherModel == null
          //     ? const NoWeatherBody()
          //     : const WeatherInfoBody(),

          // the fifth step is integrate cubit : to use BlocBuilder to rebuild the UI based on the current state of the Cubit
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
            // state هو الحالة الحالية لل Cubit اللي انا بستخدمه هنا اللي هو (emit اللي بعتته اخر مرة)
            builder: (context, state) {
              if (state is WeatherInitialState) {
                return const NoWeatherBody();
              } else if (state is WeatherLoadedState) {
                // state بتمثل WeatherLoadedState هنا عشان الحالة الحالية هي WeatherLoadedState
                return WeatherInfoBody(weather: state.weatherModel);
              } else if (state is WeatherFailureState) {
                return const Center(
                  child: Text(
                    "Failed to fetch weather data. Please try again.",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                );
              } else {
                return const NoWeatherBody(); // Or some other default widget
              }
            },
          ),
        );
      },
    );
  }
}
