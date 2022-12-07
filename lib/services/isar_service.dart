import 'package:isar/isar.dart';
import 'package:open_gym/models/user_settings.dart';
import 'package:open_gym/models/workout.dart';
import 'package:open_gym/providers/default_exercises.dart';

import '../models/exercise.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
    checkDefault();
  }

  Future<void> checkDefault() async {
    int defExLib = await checkExerciseLibrary();
    if (defExLib == 0) {
      await addDefaultExercises();
    }
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
          [UserSettingsSchema, ExerciseSchema, WorkoutSchema]);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> createUserSettings(UserSettings userSettings) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.userSettings.putSync(userSettings));
  }

  Future<UserSettings?> getUserSettings(int id) async {
    final isar = await db;
    return isar.userSettings.getSync(id);
  }

  Future<int> checkExerciseLibrary() async {
    final isar = await db;
    return isar.exercises.getSizeSync();
  }

  Future<void> addDefaultExercises() async {
    final isar = await db;
    isar.writeTxnSync<List<int>>(
        () => isar.exercises.putAllSync(DEFAULT_EXERCISES));
  }

  // TODO: return all exercises
  Future<List<Exercise>> getAllExercises() async {
    final isar = await db;
    return isar.exercises.where().findAllSync();
  }

  Future<List<Exercise>> getByCategory(String category) async {
    final isar = await db;
    return isar.exercises
        .filter()
        .bodyPartsElementEqualTo(category)
        .findAllSync();
  }

  Future<Workout?> getWorkout(Id id) async {
    final isar = await db;
    return isar.workouts.getSync(id);
  }

  Future<void> removeWorkout(Id id) async {
    final isar = await db;
    isar.writeTxnSync<Set<bool>>(() => {isar.workouts.deleteSync(id)});
  }

  Future<void> removeExercises(
      Workout workout, List<Exercise> toBeRemoved) async {
    final isar = await db;
    workout.exercises.removeWhere((element) => toBeRemoved.contains(element));
    isar.writeTxnSync(() => {workout.exercises.saveSync()});
  }

  Future<void> addWorkout(Workout workout) async {
    final isar = await db;
    isar.writeTxnSync(() {
      isar.workouts.putSync(workout);
    });
  }



  Future<List<Workout>> getAllWorkouts() async {
    final isar = await db;
    return isar.workouts.where().findAllSync();
  }
}
