import 'package:flutter/material.dart';
import 'package:open_gym/screens/schedule_plan.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  static const routeName = '/schedule';
  IsarService isarService;

  Schedule({Key? key, required this.isarService}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(DateTime.now().year + 10),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SchedulePlan(focusedDate: _focusedDay),
              ));
        },
        child: const Icon(Icons.pending_actions),
      ),
    );
  }
}
