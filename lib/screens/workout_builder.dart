import 'package:flutter/material.dart';
import 'package:open_gym/services/isar_service.dart';

import '../models/exercise.dart';
import '../models/workout.dart';

class WorkoutBuilder extends StatefulWidget {
  static const routeName = '/workout-builder';
  IsarService isarService;

  WorkoutBuilder({Key? key, required this.isarService}) : super(key: key);

  @override
  State<WorkoutBuilder> createState() => _WorkoutBuilderState();
}

class _WorkoutBuilderState extends State<WorkoutBuilder> {
  TextEditingController _workoutNameController = TextEditingController();
  List<Exercise> exerciseLibrary = [];
  List<Exercise> selectedExercises = [];
  List<Exercise> toBeRemoved = [];
  bool _editing = false;

  static String _displayStringForOption(Exercise exercise) => exercise.name!;

  Future<List<Exercise>> getExerciseLibrary() {
    return widget.isarService.getAllExercises();
  }

  void createWorkout(Workout? editWorkout) {
    if (_editing) {
      widget.isarService.removeExercises(editWorkout!, toBeRemoved);
    }else {
      final workout = Workout()
        ..name = _workoutNameController.text
        ..exercises.addAll(selectedExercises);

      widget.isarService.addWorkout(workout);
    }
  }

  void removeExercise(Exercise exercise) {}

  @override
  Widget build(BuildContext context) {
    final workoutForEdit =
        ModalRoute.of(context)!.settings.arguments as Workout?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Builder'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            createWorkout(workoutForEdit);
            Navigator.pop(context);
          },
          child: const Icon(Icons.save)),
      body: FutureBuilder(
        future: getExerciseLibrary(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (workoutForEdit != null && !_editing) {
              _editing = true;
              selectedExercises = workoutForEdit.exercises.toList();
              _workoutNameController.text = workoutForEdit.name;
            }
            exerciseLibrary = snapshot.data!;
            return Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Workout Name'),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _workoutNameController,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _openSearchDialog();
                    },
                    child: const Text('Add Exercise'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectedExercises[index].name!),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      toBeRemoved.add(selectedExercises[index]);
                                      selectedExercises.remove(selectedExercises[index]);
                                    });
                                  },
                                  child: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: selectedExercises.length,
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Loading Dependencies'),
            );
          }
        },
      ),
    );
  }

  void _handleExerciseSelection(Exercise exercise) {
    setState(() {
      selectedExercises.add(exercise);
    });
  }

  void _openSearchDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Column(
              children: [
                Autocomplete<Exercise>(
                  fieldViewBuilder: ((context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    FocusScope.of(context).requestFocus(focusNode);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onEditingComplete: onFieldSubmitted,
                            decoration: const InputDecoration(
                                hintText: 'Search Exercise',
                                contentPadding: EdgeInsets.all(8)),
                          ),
                        ],
                      ),
                    );
                  }),
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<Exercise>.empty();
                    }
                    return exerciseLibrary.where((element) => element.name!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (Exercise? selected) {
                    _handleExerciseSelection(selected!);
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    key: UniqueKey(),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(exerciseLibrary[index].name!),
                        onTap: () {
                          _handleExerciseSelection(exerciseLibrary[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                    itemCount: exerciseLibrary.length,
                  ),
                )
              ],
            ),
          ));
}
