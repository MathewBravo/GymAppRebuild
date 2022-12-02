import 'package:flutter/material.dart';
import 'package:open_gym/models/user_settings.dart';
import 'package:open_gym/services/isar_service.dart';

class UserSettingsScreen extends StatefulWidget {
  static const routeName = '/user-settings';
  final IsarService isarService;

  const UserSettingsScreen({Key? key, required this.isarService})
      : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late UserSettings? settings;
  late bool _kgValue;
  final defaultSettings = UserSettings()
    ..useKg = true
    ..lowestPlate = 5.0;

  @override
  initState() {
    super.initState();
  }

  void changeKg(bool value){
    _kgValue = value;
    settings!.useKg = value;
    widget.isarService.createUserSettings(settings!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserSettings'),
        ),
        body: FutureBuilder<UserSettings?>(
          future: widget.isarService.getUserSettings(1),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              settings = snapshot.data!;
              if(settings == null){
                print('called');
                settings = defaultSettings;
                widget.isarService.createUserSettings(settings!);
              }
              _kgValue = settings!.useKg!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Use Kg',
                          style: TextStyle(fontSize: 24),
                        ),
                        Switch(
                            value: _kgValue,
                            onChanged: (bool value) {
                              setState(() {
                                changeKg(value);
                              });
                            })
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            }else{
              return const Text('Fetching Settings');
            }
          },
        ));
  }
}
