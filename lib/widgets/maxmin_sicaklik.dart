import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather/bloc.dart';

class MaxMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherState=BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherState,
      builder: (context,WeatherState state)=>
       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        Text("Max : "+(state as WeatherLoadedState).weather.consolidatedWeather[0].maxTemp.floor().toString()+"C"),
        Text("Min : "+(state as WeatherLoadedState).weather.consolidatedWeather[0].minTemp.floor().toString()+"C")
      ],),
    );
  }
}
