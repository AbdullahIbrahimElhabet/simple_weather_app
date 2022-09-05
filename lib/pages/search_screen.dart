import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api_manager.dart';
import 'package:weather_app/provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const String screenName = "search";
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search a City ",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (text) {
                cityName = text;
              },
              onSubmitted: (text) async {
                cityName = text;
                var response = await ApiManger.getWeather(cityName: cityName);
                provider.setWeatherResponse = response;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Enter a City",
                  labelText: "Search",
                  suffixIcon: IconButton(
                      onPressed: () async {
                        var response =
                            await ApiManger.getWeather(cityName: cityName);
                        provider.setWeatherResponse = response;
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.search))),
            )
          ],
        ),
      ),
    );
  }
}
