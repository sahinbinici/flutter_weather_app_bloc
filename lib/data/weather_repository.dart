import 'package:weather/blocs/model/Weather.dart';
import 'package:weather/data/weather_api_client.dart';
import 'package:weather/locator.dart';

class WeatherRepository{
  WeatherApiClient weatherApiClient=locator<WeatherApiClient>();
  Future<Weather> getWeather(String sehir) async{
  int sehirID=await weatherApiClient.getLocationID(sehir);
  return await weatherApiClient.getWeather(sehirID);

  }
}