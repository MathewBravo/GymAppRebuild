import 'package:flutter/material.dart';
import 'package:open_gym/screens/plan_builder.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

class MyPlans extends StatelessWidget {
  static const routeName = '/my-plans';
  IsarService isarService;

  MyPlans({Key? key, required this.isarService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plans'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('My Plans'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PlanBuilder.routeName);

        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
