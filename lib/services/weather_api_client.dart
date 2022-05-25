import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_models.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(
      double? longitude, double? latitude) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cb62cbfc1938d2556f9ef2359f1225e8&units=metric");
    var respose = await http.get(endpoint);
    var body = jsonDecode(respose.body);
    print(Weather.fromJson(body));

    return Weather.fromJson(body);
  }
}
