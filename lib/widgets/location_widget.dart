import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String secilenSehir;

  LocationWidget({@required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Text(secilenSehir,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 48),);
  }
}
