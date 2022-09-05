import 'package:flutter/material.dart';
import 'package:weather_app/model/WeatherResponse.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherResponse? _weatherResponse;

  set setWeatherResponse(WeatherResponse? weatherResponse) {
    _weatherResponse = weatherResponse;
    notifyListeners();
  }

  WeatherResponse? get getWeatherResponse => _weatherResponse;

  String getImages() {
    if (getWeatherResponse?.current?.condition?.text == "Sunny") {
      return "assets/images/clear.png";
    }
    if (getWeatherResponse?.current?.condition?.text == "Partly cloudy") {
      return "assets/images/cloudy.png";
    }
    if (getWeatherResponse?.current?.condition?.text == "Partly cloudy") {
      return "assets/images/cloudy.png";
    }
    if (getWeatherResponse?.current?.condition?.text == "Rain") {
      return "assets/images/rainy.png";
    }
    if (getWeatherResponse?.current?.condition?.text == "Snow") {
      return "assets/images/snow.png";
    }
    if (getWeatherResponse?.current?.condition?.text == "Storm" ||
        getWeatherResponse?.current?.condition?.text == "Thunder Storm") {
      return "assets/images/thunderstorm.png";
    }
    return "assets/images/clear.png";
  }

  MaterialColor getTheme() {
    if (getWeatherResponse?.current?.condition?.text == "Sunny") {
      return Colors.amber;
    }
    if (getWeatherResponse?.current?.condition?.text == "Partly cloudy") {
      return Colors.yellow;
    }
    if (getWeatherResponse?.current?.condition?.text == "Rain") {
      return Colors.lightBlue;
    }
    if (getWeatherResponse?.current?.condition?.text == "Snow") {
      return Colors.grey;
    }
    if (getWeatherResponse?.current?.condition?.text == "Storm" ||
        getWeatherResponse?.current?.condition?.text == "Thunder Storm") {
      return Colors.blueGrey;
    }
    return Colors.blue;
  }
}
