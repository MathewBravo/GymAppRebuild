import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_gym/screens/home_page.dart';
import 'package:open_gym/screens/how_to.dart';
import 'package:open_gym/screens/plate_calculator.dart';
import 'package:open_gym/screens/user_settings.dart';
import 'package:open_gym/services/isar_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final isarService = IsarService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
      routes:{
        HowToScreen.routeName: (context) => const HowToScreen(),
        UserSettingsScreen.routeName: (context) => UserSettingsScreen(isarService: isarService,),
        PlateCalculatorScreen.routeName: (context) => const PlateCalculatorScreen(),
      } ,
    );
  }
}

