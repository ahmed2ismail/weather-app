import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:advanced_weather_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  // await dotenv.load(fileName: ".env");
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // the fourth step is to provide the Cubit to the widget tree using BlocProvider
    return BlocProvider(
      // انا بوفر ال Cubit ده لكل ال Widgets اللي جوه ال MaterialApp واللي هما HomeView و SearchView
      // BlocProvider is a Flutter widget which provides a bloc to its children via هو مبني علي InheritedWidget ودي معناها ان اي حد جوه ال Widget tree بتاعته يقدر يوصل لل Cubit اللي انا بيوفره
      // the create property is a function that creates the instance of the Cubit
      create: (context) => GetWeatherCubit(),
      child: Builder(
        // استخدمنا ال Builder عشان نعمل context جديد يكون تحت استدعاء ال cubit بتاعي
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  // ال primarySwatch بيعمل مجموعة من درجات الألوان المشتقة من اللون الأساسي (primary color) لتطبيقها على مكونات واجهة المستخدم المختلفة.
                  //  بمعنى آخر، هو يحدد لوحة الألوان الرئيسية لتطبيقك.
                  //  عندما تقوم بتعيين primarySwatch، فإن Flutter يقوم تلقائيًا بإنشاء مجموعة من الألوان الفاتحة والداكنة بناءً على اللون الذي تختاره،
                  //  ويستخدم هذه الألوان لتلوين عناصر مثل الـ AppBar، الأزرار، مؤشرات التقدم، وغيرها.
                  //  هذا يساعد في الحفاظ على تناسق التصميم عبر التطبيق بأكله.
                  //  على سبيل المثال، إذا قمت بتعيين primarySwatch: Colors.blue،
                  //  فإن Flutter سيستخدم درجات مختلفة من اللون الأزرق لتلوين عناصر واجهة المستخدم.
                  primarySwatch: getThemeColor(
                    condition: BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light rain shower":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light drizzle":
    case "Patchy light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Patchy snow possible":
    case "Light snow shower":
    case "Moderate or heavy snow showers":
    case "Patchy sleet possible":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Blizzard":
    case "Patchy light snow":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue; // Default color
  }
}
