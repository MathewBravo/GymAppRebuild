import 'package:flutter/material.dart';

class SchedulePlan extends StatefulWidget {
  SchedulePlan({Key? key, required this.focusedDate}) : super(key: key);
  DateTime focusedDate;
  @override
  State<SchedulePlan> createState() => _SchedulePlanState();
}

class _SchedulePlanState extends State<SchedulePlan> {
  @override
  Widget build(BuildContext context) {
    print(widget.focusedDate.toString());
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Plan'),),
    );
  }
}
