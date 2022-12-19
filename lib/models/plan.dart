import 'package:isar/isar.dart';
import 'package:open_gym/models/workout.dart';
part 'plan.g.dart';

@collection
class Plan{
  Id? id;
  int? duration;
  String? type;
  String? name;
  bool? hasDeload;
  List<DayOfTheWeek>? plannedWorkouts;
}

@embedded
class DayOfTheWeek{
  String? day;
  int? workoutId;
}