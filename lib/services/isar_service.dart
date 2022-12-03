import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:open_gym/models/user_settings.dart';
import 'package:open_gym/providers/default_exercises.dart';

import '../models/exercise.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
    checkDefault();
  }

  Future<void> checkDefault() async{
    int defExLib = await checkExerciseLibrary();
    if(defExLib == 0){
      await addDefaultExercises();
    }
    print(defExLib);
  }



  Future<Isar> openIsar() async {
    if(Isar.instanceNames.isEmpty) {
      return await Isar.open([UserSettingsSchema, ExerciseSchema]);
    }
    return Future.value(Isar.getInstance());
  }


  Future<void> createUserSettings(UserSettings userSettings) async{
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.userSettings.putSync(userSettings));
  }

  Future<UserSettings?> getUserSettings(int id) async {
    final isar = await db;
    return isar.userSettings.getSync(id);
  }

  Future<int> checkExerciseLibrary() async{
    final isar = await db;
    return isar.exercises.getSizeSync();
  }

  Future<void> addDefaultExercises() async{
    final isar = await db;
    isar.writeTxnSync<List<int>>(() => isar.exercises.putAllSync(DEFAULT_EXERCISES));
  }





}
