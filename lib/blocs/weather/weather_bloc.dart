import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather/blocs/model/Weather.dart';
import 'package:weather/data/weather_repository.dart';
import 'package:weather/locator.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository=locator<WeatherRepository>();
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event,) async* {
    if(event is FetchWeatherEvent){
      yield WeatherLoadingState();
      try{

        final getirilenWeather=await _weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      }catch(e){
        yield WeatherErrorState();
      }
    }else if(event is RefreshWeatherEvent){

      try{

        final getirilenWeather=await _weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      }catch(e){
        yield WeatherErrorState();
      }
    }
  }
}
