class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherCondition,
  });

  // نقدر نستخدم ال named constructor عشان انشا constructor بيبنيلي ال object ببيانات جاهزة جايالي من ال API ونقدر نستخدم factory  ال عشان بتسمحلي اعمل return لل object ذات نفسه

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // json هي عبارة عن Map<String, dynamic>  جايالي من ال API (الكبيرة خالص اللي فيها كل البيانات بتاعتي "response.body")
    return WeatherModel(
      cityName: json["location"]["name"], // جايبلي اسم المدينة
      date: DateTime.parse(json["current"]["last_updated"]), // جايبلي التاريخ والوقت
      image:
          json["forecast"]["forecastday"][0]["day"]["condition"]["icon"], // جايبلي الصورة
      temp:
          json["forecast"]["forecastday"][0]["day"]["avgtemp_c"], // جايبلي درجة الحرارة
      maxtemp:
          json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], // جايبلي اعلى درجة حرارة
      mintemp:
          json["forecast"]["forecastday"][0]["day"]["mintemp_c"], // جايبلي اقل درجة حرارة
      weatherCondition:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"], // (جايبلي حالة الطقس (مشمس، غائم، ممطر...
    );
  }
}
