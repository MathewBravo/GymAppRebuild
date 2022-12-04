import 'package:flutter/material.dart';
import 'package:open_gym/screens/workout_builder.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

class MyWorkouts extends StatelessWidget {
  static const routeName = '/my-workouts';
  IsarService isarService;
  MyWorkouts({Key? key, required this.isarService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workouts'),
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.pushNamed(context, WorkoutBuilder.routeName);
      } ,child: const Icon(Icons.add),),
    );
  }
}
