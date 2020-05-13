import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather/weather_bloc.dart';
import 'package:weather/blocs/weather/weather_state.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherState=BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherState,
      builder: (context,WeatherState state)=>
        Image.network("https://www.metaweather.com/static/img/weather/png/"+(state as WeatherLoadedState).weather.consolidatedWeather[0].weatherStateAbbr+".png",width: 300,height: 300,)

    );
  }
}
