import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather/bloc.dart';
import 'package:weather/locator.dart';
import 'package:weather/widgets/weather_app.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<WeatherBloc>(
          create: (context)=> WeatherBloc(),
          child: WeatherApp()),
    );
  }
}


