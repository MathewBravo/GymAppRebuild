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
  double lowestPlate = 5;

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

  Widget setRunnerNormalSet(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
                flex: 2,
                child: SizedBox(
                  width: 10,
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Weight'),
                  Text('Reps'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return SizedBox(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      i > 0
                          ? Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      onPressed: () {
                                        if (double.tryParse(
                                                _weightForSetController[index]![
                                                        i - 1]
                                                    .text) !=
                                            null) {
                                          double minusFive = double.parse(
                                                  _weightForSetController[
                                                          index]![i - 1]
                                                      .text) -
                                              lowestPlate;
                                          _weightForSetController[index]![i]
                                                  .text =
                                              minusFive.toStringAsFixed(0);
                                        }
                                      },
                                      child: const Text('-5'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap),
                                        onPressed: () {
                                          _weightForSetController[index]![i]
                                              .text = _weightForSetController[
                                                  index]![i - 1]
                                              .text;
                                        },
                                        child: const Icon(Icons.copy)),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      onPressed: () {
                                        if (double.tryParse(
                                                _weightForSetController[index]![
                                                        i - 1]
                                                    .text) !=
                                            null) {
                                          double minusFive = double.parse(
                                                  _weightForSetController[
                                                          index]![i - 1]
                                                      .text) +
                                              lowestPlate;
                                          _weightForSetController[index]![i]
                                                  .text =
                                              minusFive.toStringAsFixed(0);
                                        }
                                      },
                                      child: const Text('+5'),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const Expanded(
                              flex: 2,
                              child: Center(child: Text('Copy Above Weight'))),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 40,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller:
                                      _weightForSetController[index]![i],
                                  onFieldSubmitted: (String? string) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(width: 45),
                              SizedBox(
                                width: 30,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: _repForSetController[index]![i],
                                  onFieldSubmitted: (String? string) {
                                    print(_repForSetController[index]![i].text);
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: setNum[index],
        ),
      ]),
    );
  }

  Widget setRunnerMyoRep(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Weight'),
            SizedBox(width: 45),
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
            return SizedBox(
              height: 50,
              child: Column(
                children: [
                  i == 0
                      ? Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        controller:
                                            _weightForSetController[index]![i],
                                        onFieldSubmitted: (String? string) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 45),
                                    SizedBox(
                                      width: 30,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        controller:
                                            _repForSetController[index]![i],
                                        onFieldSubmitted: (String? string) {
                                          print(_repForSetController[index]![i]
                                              .text);
                                        },
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: Center(child: Text(_weightForSetController[index]![0].text)),
                                    ),
                                    SizedBox(width: 45),
                                    SizedBox(
                                      width: 30,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        controller:
                                            _repForSetController[index]![i],
                                        onFieldSubmitted: (String? string) {
                                          print(_repForSetController[index]![i]
                                              .text);
                                        },
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                ],
              ),
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
                          //TODO: Add combo box to select set type
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
                    if (setNum[index] != 0) setRunnerMyoRep(index),
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
