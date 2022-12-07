import 'package:flutter/material.dart';
import 'package:open_gym/models/workout.dart';
import 'package:open_gym/widgets/main_drawer.dart';

import '../models/exercise.dart';

class RunWorkout extends StatefulWidget {
  RunWorkout({Key? key, required this.runningWorkout}) : super(key: key);
  Workout runningWorkout;

  @override
  State<RunWorkout> createState() => _RunWorkoutState();
}

class _RunWorkoutState extends State<RunWorkout> {
  List<Exercise> exercisesForWorkout = [];
  List<int> setNum = [];

  final Map<int, List<TextEditingController>> _weightForSetController = {};
  final Map<int, List<TextEditingController>> _repForSetController = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exercisesForWorkout = widget.runningWorkout.exercises.toList();
    int count = 0;
    for (Exercise ex in exercisesForWorkout) {
      setNum.add(0);
      _weightForSetController[count] = [];
      _repForSetController[count] = [];
      count++;
    }
  }

  Widget setRunner(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Copy Above Weight'),
            Text('Set'),
            Text('Weight'),
            Text('Reps'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    i > 0
                        ? SizedBox(
                            width: 60,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                onPressed: () {
                                  _weightForSetController[index]![i].text =
                                      _weightForSetController[index]![i - 1]
                                          .text;
                                },
                                child: const Icon(Icons.copy)),
                          )
                        : const SizedBox(
                            width: 60,
                          ),
                    Text('${i + 1}'),
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _weightForSetController[index]![i],
                        onFieldSubmitted: (String? string) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _repForSetController[index]![i],
                        onFieldSubmitted: (String? string) {
                          print(_repForSetController[index]![i].text);
                        },
                      ),
                    )
                  ],
                ),
              ],
            );
          },
          itemCount: setNum[index],
        ),
      ]),
    );
  }

  void finishWorkout() {
    print('finish');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runningWorkout.name),
        actions: [
          ElevatedButton(
              onPressed: finishWorkout, child: const Text('Finish Workout'))
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(exercisesForWorkout[index].name!),
                          Row(
                            children: [
                              const Text('Sets'),
                              IconButton(
                                  onPressed: () {
                                    if (setNum[index] > 0) {
                                      setState(() {
                                        setNum[index]--;
                                        _weightForSetController[index]
                                            ?.removeLast();
                                        _repForSetController[index]
                                            ?.removeLast();
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove)),
                              Text(setNum[index].toString()),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      setNum[index]++;
                                      _weightForSetController[index]
                                          ?.add(TextEditingController());
                                      _repForSetController[index]
                                          ?.add(TextEditingController());
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                              const SizedBox(width: 40),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (setNum[index] != 0) setRunner(index),
                    Divider(),
                  ],
                );
              },
              shrinkWrap: true,
              itemCount: exercisesForWorkout.length,
            ),
            ElevatedButton(
                onPressed: finishWorkout, child: const Text('Finish Workout')),
          ],
        ),
      ),
    );
  }
}
