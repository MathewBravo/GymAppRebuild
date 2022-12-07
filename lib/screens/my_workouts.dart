import 'package:flutter/material.dart';
import 'package:open_gym/screens/run_workout.dart';
import 'package:open_gym/screens/workout_builder.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

import '../models/workout.dart';

class MyWorkouts extends StatefulWidget {
  static const routeName = '/my-workouts';
  IsarService isarService;

  MyWorkouts({Key? key, required this.isarService}) : super(key: key);

  @override
  State<MyWorkouts> createState() => _MyWorkoutsState();
}

class _MyWorkoutsState extends State<MyWorkouts> {
  @override
  initState() {
    super.initState();
  }

  Future<List<Workout>> getWorkoutLibrary() async {
    return await widget.isarService.getAllWorkouts();
  }

  void removeWorkout(int id) async {
    widget.isarService.removeWorkout(id);
  }

  @override
  Widget build(BuildContext context) {
    List<Workout> workoutLibrary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workouts'),
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder(
        future: getWorkoutLibrary(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            workoutLibrary = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(workoutLibrary[index].name),
                        const SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RunWorkout(
                                          runningWorkout:
                                              workoutLibrary[index])));
                            },
                            child: const Text('Run')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, WorkoutBuilder.routeName,
                                  arguments: workoutLibrary[index]);
                            },
                            child: const Text('Edit')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                removeWorkout(workoutLibrary[index].id!);
                              });
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: workoutLibrary.length,
            );
          } else {
            return const Center(
              child: Text('Fetching Workout Library'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, WorkoutBuilder.routeName)
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
