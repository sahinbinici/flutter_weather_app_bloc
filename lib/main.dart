import 'package:flutter/material.dart';
import 'package:weather/widgets/weather_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WeatherApp(),
    );
  }
}


