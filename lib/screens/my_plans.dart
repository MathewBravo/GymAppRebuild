import 'package:flutter/material.dart';
import 'package:open_gym/screens/plan_builder.dart';
import 'package:open_gym/services/isar_service.dart';
import 'package:open_gym/widgets/main_drawer.dart';

import '../models/plan.dart';

class MyPlans extends StatefulWidget {
  static const routeName = '/my-plans';
  IsarService isarService;

  MyPlans({Key? key, required this.isarService}) : super(key: key);

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  Future<List<Plan>> getPlanLibrary() async {
    return await widget.isarService.getAllPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plans'),
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder(
        future: getPlanLibrary(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Plan> plans = snapshot.data!;
            if (plans.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(plans[index].name!),
                ),
                itemCount: plans.length,
              );
            } else {
              return const Center(
                child: Text('No Plans Found'),
              );
            }
          } else {
            return const Center(
              child: Text('Fetching Plans'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PlanBuilder.routeName)
              .then((value) => setState(() {}));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
