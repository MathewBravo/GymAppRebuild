import 'package:flutter/material.dart';
import 'package:open_gym/services/isar_service.dart';

import '../models/workout.dart';

class WorkoutLibrary extends StatefulWidget {
  WorkoutLibrary({Key? key, required this.isarService}) : super(key: key);
  IsarService isarService;

  @override
  State<WorkoutLibrary> createState() => _WorkoutLibraryState();
}

class _WorkoutLibraryState extends State<WorkoutLibrary> {
  List<Workout> workoutLibrary = [];

  Future<List<Workout>> getLibrary() {
    return widget.isarService.getAllWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Library"),
      ),
      body: FutureBuilder(
        future: getLibrary(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            workoutLibrary = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(workoutLibrary[index].name),
                  onTap: () {
                    Navigator.of(context).pop(workoutLibrary[index]);
                  },
                );
              },
              itemCount: workoutLibrary.length,
            );
          } else {
            return const Center(
              child: Text('Fetching Library'),
            );
          }
        },
      ),
    );
  }
}
