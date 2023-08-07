import 'package:flutter/material.dart';
import 'package:travel_app/vars.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    setState(() {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    });
    configColors();
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: primary,
        height: s.height,
        width: s.width,
        child: PageView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
        Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
