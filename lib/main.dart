import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.screenName,
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        SearchScreen.screenName: (context) => SearchScreen()
      },
      theme: ThemeData(
          primarySwatch: provider.getWeatherResponse == null
              ? Colors.blue
              : provider.getTheme()),
    );
  }
}
