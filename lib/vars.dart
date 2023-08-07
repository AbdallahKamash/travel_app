import 'package:flutter/material.dart';

bool isDarkMode = false;
Color primary = Colors.white;
Color secondary = Colors.black;
Color palette = Colors.blue;

void configColors() {
  if (isDarkMode) {
    primary = Colors.black;
    secondary = Colors.white;
    palette = Colors.blue;
  } else {
    primary = Colors.white;
    secondary = Colors.black;
    palette = Colors.blue;
  }
}