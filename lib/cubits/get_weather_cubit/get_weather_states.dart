// the first step in cubit is to create States file:
// States for GetWeatherCubit (create States اللي هي اوضاع التطبيق دلوقت اللي ممكن تحصل)
// كل حالة بتمثل وضع معين للتطبيق والاولي هي انه ميبقاش فيه بيانات طقس والتانية انه يكون فيه بيانات طقس والتالتة انه حصل خطأ في جلب بيانات الطقس
import 'package:advanced_weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String? errormessage;
  WeatherFailureState({this.errormessage});
}
