import 'package:flutter/material.dart';
import 'package:open_gym/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
