import 'package:isar/isar.dart';
part 'exercise.g.dart';

@collection
class Exercise {
  Id id = Isar.autoIncrement;
  String? name;
  List<String>? bodyParts;
  double? barWeight;
  bool? assisted;

  Exercise(
      {required this.name,
      required this.bodyParts,
      required this.barWeight,
      this.assisted = false});
}
