import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../services/isar_service.dart';

class ExerciseByType extends StatefulWidget {
  static const routeName = '/exercise-by-type';
  String type;
  IsarService isarService;

  ExerciseByType({Key? key, required this.type, required this.isarService})
      : super(key: key);

  @override
  State<ExerciseByType> createState() => _ExerciseByTypeState();
}

class _ExerciseByTypeState extends State<ExerciseByType> {
  List<Exercise> exercises = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List<Exercise>> setExercises() async {
    if (widget.type == 'All') {
      return await widget.isarService.getAllExercises();
    } else {
      return await widget.isarService.getByCategory(widget.type);
    }
    // print(exercises);
  }

  @override
  Widget build(BuildContext context) {
    print(exercises.length);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.type),
        ),
        body: FutureBuilder(
          future: setExercises(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              exercises = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(exercises[index].name!),
                  );
                },
                itemCount: exercises.length,
              );
            } else {
              return const Center(
                child: Text('Loading Library'),
              );
            }
          },
        ));
  }
}
