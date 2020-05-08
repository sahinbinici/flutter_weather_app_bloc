import 'package:flutter/material.dart';
import 'package:weather/widgets/hava_durumu_resim.dart';
import 'package:weather/widgets/location_widget.dart';
import 'package:weather/widgets/maxmin_sicaklik.dart';
import 'package:weather/widgets/sehir_sec.dart';
import 'package:weather/widgets/son_guncelleme.dart';


class WeatherApp extends StatelessWidget {
  String kullanicininSecitigiSehir="Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: ()async{
            kullanicininSecitigiSehir=await Navigator.push(context, MaterialPageRoute(builder: (context) => SehirSecWidget()));
            debugPrint(kullanicininSecitigiSehir);
          })
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(secilenSehir: kullanicininSecitigiSehir)),
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
      ),
    );
  }
}
