import 'package:flutter/material.dart';
import 'package:open_gym/providers/default_exercises.dart';
import 'package:open_gym/screens/exercise_by_type.dart';

class ExerciseLibrary extends StatelessWidget {
  static const routeName = '/exercise-library';


  const ExerciseLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(EXERCISE_TYPES[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ExerciseByType(type: EXERCISE_TYPES[index])));
            },
          );
        },
        itemCount: EXERCISE_TYPES.length,
      ),
    );
  }
}
