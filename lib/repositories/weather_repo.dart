import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reso_bloc1/models/weather_model.dart';

class WeatherRepository {
  Future<Weather> getWeather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final responseString = jsonEncode(responseJson);

      Weather weather = weatherFromJson(responseString);

      return weather;
    } else {
      print('Error code is ${response.statusCode}, body is ${response.body}');
      throw Exception();
    }
  }
}
