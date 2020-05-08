import 'package:flutter/material.dart';

class MaxMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      Text("Max : "+24.toString()+"C"),
      Text("Min : "+12.toString()+"C")
    ],);
  }
}
