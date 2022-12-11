import 'package:isar/isar.dart';
part 'ran_workouts.g.dart';
@collection
class RanWorkout {
  Id? id;
  DateTime? dateRan;
  List<IncludedExercises>? includedExercises;
}

@embedded
class IncludedExercises{
  String? exerciseName;
  int? setCount;
  List<double>? weight;
  List<int>? reps;
}