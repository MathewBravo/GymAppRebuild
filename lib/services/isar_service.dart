import 'package:isar/isar.dart';
import 'package:open_gym/models/user_settings.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if(Isar.instanceNames.isEmpty) {
      return await Isar.open([UserSettingsSchema]);
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



}
