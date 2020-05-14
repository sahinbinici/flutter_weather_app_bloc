import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TemaState extends Equatable {
  TemaState([List props=const[]]):super(props);
}

class UygulamaTemasi extends TemaState{
  final ThemeData tema;
  final MaterialColor renk;
  UygulamaTemasi({@required this.tema,@required this.renk}):super([tema,renk]);
}
