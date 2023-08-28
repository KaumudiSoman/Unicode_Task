import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unicode_app/weather_model.dart';

class Repo {
  getWeather(String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=b04ffa1026d2f139a5003242f410609e";

    final response = await http.get(Uri.parse(url));

    var responseBody = response.body;

    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(responseBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
