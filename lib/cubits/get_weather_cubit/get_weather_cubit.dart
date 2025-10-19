// the second step in cubit is to create Cubit file:
// Create GetWeatherCubit to manage the states of weather data fetching process
// هنا الكيوبت هيبقي مسؤول عن تغيير الحالات اللي احنا عملناها في ملف ال States بناءا علي الاحداث اللي بتحصل في التطبيق
import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:advanced_weather_app/models/weather_model.dart';
import 'package:advanced_weather_app/services/weather_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  // initialState ==> هي القيمة اللي هيبقي عليها ال Cubit في البداية
  // initialState ==> NoWeatherState عشان مفيش بيانات طقس في البداية هتبقي
  GetWeatherCubit() : super(WeatherInitialState());
  // the third step is to create functions that will be called to change the states based on events
  getWeather({required String cityName}) async {
    // logic to fetch weather data and emit appropriate states
    try {
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      // emit بعد ما جبت بيانات الطقس هبعت الحالة اللي بتقول ان البيانات اتحملت بنجاح عن طريق
      // emit => بتبعت الحالة الجديدة لل Cubit عشان اي حد بيستمع ليها ياخدها
      // emit (ارسال او بيبعت) is meaning "send out" or "broadcast" in the context of state management. بمعني يبعت الحالة الجديدة لل Cubit
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(errormessage: e.toString()));
    }
    // كده الكيوبت هيعبت لل للواجهة الحالة اللي بتقول ان البيانات اتحملت بنجاح
  }
}
