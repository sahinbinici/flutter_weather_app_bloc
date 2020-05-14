import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TemaEvent extends Equatable {
  TemaEvent([List props=const[]]):super(props);
}

class TemaDegistirEvent extends TemaEvent{
  final String havaDurumuKisaltmasi;
  TemaDegistirEvent({@required this.havaDurumuKisaltmasi}):super([havaDurumuKisaltmasi]);
}
