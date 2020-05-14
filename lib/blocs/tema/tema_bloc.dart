import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  @override
  TemaState get initialState => UygulamaTemasi(tema: ThemeData.light(),renk: Colors.blue);

  @override
  Stream<TemaState> mapEventToState(TemaEvent event,) async* {
    UygulamaTemasi uygulamaTemasi;
    if(event is TemaDegistirEvent){
      switch(event.havaDurumuKisaltmasi){
        case "sn": //
        case "sl": //
        case "h":
        case "t":
        case "hc":
          uygulamaTemasi=UygulamaTemasi(tema: ThemeData(primaryColor: Colors.blueGrey),renk: Colors.blue);
          break;
        case "hr":
        case "lr":
          case "s":
            uygulamaTemasi=UygulamaTemasi(tema: ThemeData(primaryColor: Colors.indigoAccent),renk: Colors.indigo);
            break;
        case "lc":
        case "c":
          uygulamaTemasi=UygulamaTemasi(tema: ThemeData(primaryColor: Colors.orangeAccent),renk: Colors.yellow);
          break;
      }
      yield uygulamaTemasi;
    }
  }
}
