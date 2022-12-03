import 'package:flutter/material.dart';

class ExerciseByType extends StatefulWidget {
  static const routeName = '/exercise-by-type';
  final String type;
  const ExerciseByType({Key? key, required this.type}) : super(key: key);

  @override
  State<ExerciseByType> createState() => _ExerciseByTypeState();
}

class _ExerciseByTypeState extends State<ExerciseByType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type),),
    );
  }
}
