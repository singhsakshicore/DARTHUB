import 'dart:convert';
import 'package:first_app/models/weather_modal.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey = '58e383e9e32365630a326486064527fe';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
