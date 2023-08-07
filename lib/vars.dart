import 'package:flutter/material.dart';

bool isDarkMode = false;
Color primary = Colors.white;
Color secondary = Colors.black;

Color lightPalette = Colors.blue.shade400;
Color palette = Colors.blue;
Color darkPalette = Colors.blue.shade900;

void configColors() {
  if (isDarkMode) {
    primary = Colors.black;
    secondary = Colors.white;
  } else {
    primary = Colors.white;
    secondary = Colors.black;
  }
}