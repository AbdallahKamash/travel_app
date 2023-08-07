import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/vars.dart';
import 'package:travel_app/welcome_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  final Brightness brightnessValue = WidgetsBinding.instance.window.platformBrightness;
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
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}