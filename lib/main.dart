import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/page.dart';
import 'package:travel_app/vars.dart';
import 'package:travel_app/welcome_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final Brightness brightnessValue = WidgetsBinding.instance.window.platformBrightness;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool('isNew') == null ? isNew = true : isNew = false;
  isDarkMode = brightnessValue == Brightness.dark;

  configColors();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
     MaterialApp(
      theme: ThemeData(
        fontFamily: 'Playfair',
      ),
      home: isNew ? const WelcomeScreen() : const Page1(),
      debugShowCheckedModeBanner: false,
    )
  );
}