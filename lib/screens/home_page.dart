import 'package:flutter/material.dart';
import 'package:open_gym/models/user_settings.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final isarService = IsarService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Gym Project'),
      ),
      drawer: const MainDrawer(),
    );
  }
}
