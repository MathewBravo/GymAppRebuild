import 'package:flutter/material.dart';

class Plate{
  double value;
  bool? availible;
  Color? color;
  double? size;
  Color? fontColor;
  int needed;

  Plate({this.needed = 1,this.fontColor = Colors.white,required this.color, required this.size, this.availible = true, required this.value});
}