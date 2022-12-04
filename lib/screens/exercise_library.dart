import 'package:flutter/material.dart';
import 'package:open_gym/providers/default_exercises.dart';
import 'package:open_gym/screens/exercise_by_type.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

class ExerciseLibrary extends StatelessWidget {
  static const routeName = '/exercise-library';
  IsarService isarService;

  ExerciseLibrary({Key? key, required this.isarService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(EXERCISE_TYPES[index]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExerciseByType(
                            type: EXERCISE_TYPES[index],isarService: isarService,
                          )));
            },
          );
        },
        itemCount: EXERCISE_TYPES.length,
      ),
    );
  }
}
