import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/tema/bloc.dart';
import 'package:weather/blocs/weather/bloc.dart';
import 'package:weather/locator.dart';
import 'package:weather/widgets/weather_app.dart';

void main(){
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
      create: (context)=>TemaBloc(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context,TemaState state)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: (state as UygulamaTemasi).tema,
        home: BlocProvider<WeatherBloc>(
            create: (context)=> WeatherBloc(),
            child: WeatherApp()),
      ),
    );
  }
}


