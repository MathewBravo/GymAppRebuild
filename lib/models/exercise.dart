class Exercise {
  String name;
  List<String> bodyParts;
  double barWeight;
  bool assisted;

  Exercise(
      {required this.name,
      required this.bodyParts,
      required this.barWeight,
      this.assisted = false});
}
