import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

bool isDarkMode = false;
bool isNew = true;
bool c = false;

double r = 10;

final PageTransitionSwitcher transitionSwitcher = PageTransitionSwitcher(
  duration: const Duration(milliseconds: 300),
  reverse: false,
  transitionBuilder: (
    Widget child,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SharedAxisTransition(
      child: child,
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
    );
  },
);

int activeTab = 0;
int pageNum = 0;

PageController page1Con = PageController();
PageController welcomeCon = PageController();

ImageProvider getImage(String url)  {
  try {
    final image = NetworkImage(url);
    final b = image.toString();
    return image;
  } catch (e) {
    return const AssetImage('lib/assets/waterfalls.jpeg');
  }
}

List<String> tabs = [
  'All',
  'Popular',
  'New',
  'Recommended',
  'Trending',
  'Top Rated'
];

//ignore: prefer_typing_uninitialized_variables
var places;


Color primary = Colors.white;
Color secondary = Colors.black;

Color lightPalette = Colors.yellowAccent.shade400;
Color palette = Colors.yellowAccent;
Color darkPalette = Colors.yellowAccent.shade700;

void configColors() {
  if (isDarkMode) {
    primary = Colors.black;
    secondary = Colors.white;
  } else {
    primary = Colors.white;
    secondary = Colors.black;
  }
}