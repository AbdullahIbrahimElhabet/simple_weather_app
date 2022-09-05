import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/WeatherResponse.dart';

class ApiManger {
  static var baseUrl = "api.weatherapi.com";

  static Future<WeatherResponse> getWeather({required String cityName}) async {
    //http://api.weatherapi.com/v1/forecast.json?key=8ec4e4c3c2bf44e68ed190700222908 &q=London
    var url = Uri.http(baseUrl, "/v1/forecast.json",
        {"key": "8ec4e4c3c2bf44e68ed190700222908", "q": cityName});
    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      WeatherResponse weatherResponse = WeatherResponse.fromJson(json);
      print(weatherResponse.current?.tempC);
      return weatherResponse;
    } catch (e) {
      throw (e);
    }
  }
}
