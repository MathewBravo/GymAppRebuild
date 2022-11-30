import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  //TODO: Replace Text colors with theme
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Options',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Workouts'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Plan Maker'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.library_add),
            title: const Text('Exercise Library'),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text('How To'),
              onTap: () {}),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('User Settings'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
