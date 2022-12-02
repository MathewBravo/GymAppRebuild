import 'package:flutter/material.dart';

import '../models/plates.dart';

List<Plate> kgPlateOptions= [
  Plate(value: 25, availible: true, color: Colors.red, size: 90),
  Plate(value: 20, availible: true, color: Colors.blue, size: 85),
  Plate(value: 15, availible: true, color: Colors.yellow, size: 80, fontColor: Colors.black),
  Plate(value: 10, availible: true, color: Colors.green, size: 75),
  Plate(value: 5, availible: true, color: Colors.white, fontColor: Colors.black, size: 70),
  Plate(value: 2.5, availible: true, color: Colors.black, size: 65),
  Plate(value: 1.25, availible: true, color: Colors.grey, size: 60),
  Plate(value: .50, availible: true, color: Colors.grey, size: 60),
  Plate(value: .25, availible: true, color: Colors.grey, size: 60),
];

List<Plate> lbPlateOptions = [
  Plate(value: 45, availible: true, color: Colors.grey, size: 90),
  Plate(value: 35, availible: true, color: Colors.grey, size: 85),
  Plate(value: 25, availible: true, color: Colors.grey, size: 80),
  Plate(value: 10, availible: true, color: Colors.grey, size: 75),
  Plate(value: 5, availible: true, color: Colors.grey, size: 70),
  Plate(value: 2.5, availible: true, color: Colors.grey, size: 65),
];