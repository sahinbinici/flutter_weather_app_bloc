import 'package:get_it/get_it.dart';
import 'package:weather/data/weather_api_client.dart';
import 'package:weather/data/weather_repository.dart';


  GetIt locator=GetIt();

  void setupLocator(){
      locator.registerLazySingleton(()=>WeatherRepository());
      locator.registerLazySingleton(()=>WeatherApiClient());
  }

