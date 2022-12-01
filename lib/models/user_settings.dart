import 'package:isar/isar.dart';
part 'user_settings.g.dart';
@collection
class UserSettings {
  Id id = 1;

  bool? useKg;
  double? lowestPlate;
}
