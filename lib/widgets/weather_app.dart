import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/tema/bloc.dart';
import 'package:weather/blocs/weather/bloc.dart';
import 'package:weather/widgets/hava_durumu_resim.dart';
import 'package:weather/widgets/location_widget.dart';
import 'package:weather/widgets/maxmin_sicaklik.dart';
import 'package:weather/widgets/sehir_sec.dart';
import 'package:weather/widgets/son_guncelleme.dart';


class WeatherApp extends StatelessWidget {
  String kullanicininSecitigiSehir="Ankara";
  Completer<void> _completer=Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc=BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: ()async{
            kullanicininSecitigiSehir=await Navigator.push(context, MaterialPageRoute(builder: (context) => SehirSecWidget()));

            if(kullanicininSecitigiSehir!=null){
              _weatherBloc.add(FetchWeatherEvent(sehirAdi: kullanicininSecitigiSehir));
            }
          })
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context,WeatherState state){
            if(state is InitialWeatherState){
              return Center(
                child: Text("Şehir Seçiniz"),
              );
            } if(state is WeatherLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            } if(state is WeatherLoadedState){
              final getirilenWeather=state.weather;
              kullanicininSecitigiSehir=getirilenWeather.title;
              final _havaDurumuKisaltma=getirilenWeather.consolidatedWeather[0].weatherStateAbbr;
              final temaBloc=BlocProvider.of<TemaBloc>(context);
              temaBloc.add(TemaDegistirEvent(havaDurumuKisaltmasi: _havaDurumuKisaltma));
              _completer.complete();
              _completer=Completer();
              return RefreshIndicator(
              onRefresh: (){
                _weatherBloc.add(RefreshWeatherEvent(sehirAdi: kullanicininSecitigiSehir));

                return _completer.future;
              },
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: LocationWidget(secilenSehir: getirilenWeather.title)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SonGuncellemeWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: HavaDurumuResimWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: MaxMinSicaklikWidget()),
                    ),
                  ],
                ),
              );
            }else{
              return Center(
                child: Text("Hata oluştu"),
              );
            }

          },

        ),
      ),
    );
  }
}
