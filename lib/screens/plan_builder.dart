import 'package:flutter/material.dart';
import 'package:open_gym/models/plan.dart';
import 'package:open_gym/models/workout.dart';
import 'package:open_gym/screens/workout_library.dart';
import 'package:open_gym/services/isar_service.dart';

import '../providers/plan_builder.dart';

class PlanBuilder extends StatefulWidget {
  static const routeName = '/plan-builder';
  IsarService isarService;

  PlanBuilder({Key? key, required this.isarService}) : super(key: key);

  @override
  State<PlanBuilder> createState() => _PlanBuilderState();
}

class _PlanBuilderState extends State<PlanBuilder> {
  final TextEditingController _planNameController = TextEditingController();
  Map<WeekDays, Workout> selectedWorkouts = {};
  String _dropdownValue = PLAN_TYPE.first;
  bool _withDeload = false;
  int _duration = 5;
  List<WeekDays> weekdays = [
    WeekDays(day: 'Sunday'),
    WeekDays(day: 'Monday'),
    WeekDays(day: 'Tuesday'),
    WeekDays(day: 'Wednesday'),
    WeekDays(day: 'Thursday'),
    WeekDays(day: 'Friday'),
    WeekDays(day: 'Saturday'),
  ];
  List<WeekDays> pickedDays = [];

  Future<List<Workout>> getWorkoutLibrary() async {
    return await widget.isarService.getAllWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 14.0),
        child: Form(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Plan Name:'),
                  SizedBox(width: 250,
                      child: TextFormField(controller: _planNameController,)),
                ],
              ),
              Row(
                children: [
                  const Text('Plan Type'),
                  DropdownButton(
                      value: _dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: PLAN_TYPE
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _dropdownValue = value!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  const Text('Duration'),
                  IconButton(
                      onPressed: () {
                        if (_duration == 1) {
                          return;
                        }
                        setState(() {
                          _duration--;
                        });
                      },
                      icon: const Icon(Icons.remove)),
                  Text('$_duration Weeks'),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _duration++;
                        });
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: _withDeload,
                      onChanged: (bool? value) {
                        setState(() {
                          _withDeload = value!;
                        });
                      }),
                  Text('Deload (Will Make Plan ${_duration + 1} Weeks)')
                ],
              ),
              daysOfTheWeek(),
              Text('${pickedDays.length} Days Per Week'),
              if (!pickedDays.isEmpty) selectedDays(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createPlan,
        child: const Icon(Icons.save),
      ),
    );
  }

  void seeActiveDays() {
    pickedDays = [];
    for (WeekDays day in weekdays) {
      if (day.selected == true) {
        pickedDays.add(day);
      }
    }
  }

  void createPlan() {
    for (WeekDays days in selectedWorkouts.keys) {
      if (!pickedDays.contains(days)) {
        selectedWorkouts.remove(days);
      }
    }
    List<DayOfTheWeek> workouts = [];
    selectedWorkouts.forEach((key, value) {
      DayOfTheWeek day = DayOfTheWeek();
      day.day = key.day;
      day.workoutId = value.id;
      workouts.add(day);
    });
    final newPlan = Plan()
    ..name = _planNameController.text
    ..type = _dropdownValue
    ..duration = _duration
    ..hasDeload = _withDeload
    ..plannedWorkouts =  workouts;
    widget.isarService.addPlan(newPlan);
    // Navigator.pop(context);
  }

  Widget selectedDays() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pickedDays[index].day),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorkoutLibrary(
                                  isarService: widget.isarService,
                                ),
                          )).then((value) {
                        setState(() {
                          selectedWorkouts[pickedDays[index]] = value;
                        });
                      });
                    },
                    child: const Text('Select Workout'),
                  )
                ],
              ),
              if (selectedWorkouts[pickedDays[index]] != null)
                Text(selectedWorkouts[pickedDays[index]]!.name)
              else
                Text('No Workout Selected'),
            ],
          ),
        );
      },
      itemCount: pickedDays.length,
    );
  }

  Widget daysOfTheWeek() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 4),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Checkbox(
                value: weekdays[index].selected,
                onChanged: (bool? value) {
                  setState(() {
                    weekdays[index].selected = value!;
                    seeActiveDays();
                  });
                }),
            Text(weekdays[index].day)
          ],
        );
      },
      itemCount: weekdays.length,
    );
  }
}
