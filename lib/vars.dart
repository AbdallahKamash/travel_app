import 'package:flutter/material.dart';

bool isDarkMode = false;
bool isNew = true;

PageController page1Con = PageController(initialPage: 0);

List<String> tabs = [
  'All',
  'Popular',
  'New',
  'Recommended',
  'Trending',
  'Top Rated'
];

Map<dynamic, dynamic> places = {

};


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