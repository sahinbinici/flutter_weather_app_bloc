import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/weather/bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final _weatherState=BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(bloc: _weatherState,
        builder: (context,WeatherState state)=>
        Text("Son Güncelleme "+(state as WeatherLoadedState).weather.time.toLocal().toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),));
  }
}
