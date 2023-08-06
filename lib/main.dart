import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
     MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gotham'
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}