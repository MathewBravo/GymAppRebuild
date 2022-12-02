import 'package:flutter/material.dart';
import 'package:open_gym/providers/how_to_options.dart';

class HowToScreen extends StatelessWidget {
  static const routeName = '/how-to';

  const HowToScreen({Key? key}) : super(key: key);
  final List<List<String>> menuOptions = howToOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(menuOptions[index][0]),
            expandedAlignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                child: Text(menuOptions[index][1]),
              ),
            ],
          );
        },
        itemCount: menuOptions.length,
      ),
    );
  }
}
