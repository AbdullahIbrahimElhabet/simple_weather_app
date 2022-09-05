import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String screenName = "Home";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Weather App",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.screenName);
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: provider.getWeatherResponse == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "There is no weather start searching now",
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    provider.getTheme(),
                    provider.getTheme()[400]!,
                    provider.getTheme()[300]!,
                    provider.getTheme()[100]!,
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      provider.getWeatherResponse?.location?.name ?? "",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Last Updated: ${provider.getWeatherResponse?.current?.lastUpdated?.hour.toString() ?? ""}:"
                      "${provider.getWeatherResponse?.current?.lastUpdated?.minute.toString() ?? ""}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(provider.getImages()),
                        Text(
                          provider.getWeatherResponse?.current?.tempC
                                  .toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              "max: ${provider.getWeatherResponse?.forecast?.forecastday?.elementAt(0).day?.maxtempC.toString() ?? ""}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "min: ${provider.getWeatherResponse?.forecast?.forecastday?.elementAt(0).day?.mintempC.toString() ?? ""}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "${provider.getWeatherResponse?.current?.condition?.text ?? ""}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ));
  }
}
