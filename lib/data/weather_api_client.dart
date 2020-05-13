import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather/blocs/model/Weather.dart';
class WeatherApiClient{
static final baseUrl="https://www.metaweather.com/";
final http.Client httpClient=http.Client();

  Future<int> getLocationID(String sehirAdi)async{
    final sehirUrl=baseUrl+"/api/location/search/?query="+sehirAdi;
    final gelenCevap=await httpClient.get(sehirUrl);

    if(gelenCevap.statusCode!=200){
      throw Exception("Veri Getirilemedi..");
    }
    final gelenCevapJson=(jsonDecode(gelenCevap.body)) as List;
      return gelenCevapJson[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async{
      final havaDurumuUrl=baseUrl+"/api/location/$sehirID";
      final havaDurumuGelenCevap=await httpClient.get(havaDurumuUrl);

      if(havaDurumuGelenCevap.statusCode!=200){
        throw Exception("Veri Getirilemedi..");
      }

      final havaDurumuCevapJSON=jsonDecode(havaDurumuGelenCevap.body);
      return Weather.fromJson(havaDurumuCevapJSON);
  }

}