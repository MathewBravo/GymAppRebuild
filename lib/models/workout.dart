import 'package:isar/isar.dart';

import 'exercise.dart';
part 'workout.g.dart';

@collection
class Workout{
 Id? id;

 late String name;

 final exercises = IsarLinks<Exercise>();
}