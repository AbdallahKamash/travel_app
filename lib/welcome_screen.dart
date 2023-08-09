import 'package:flutter/material.dart';
import 'package:travel_app/fade_route.dart';
import 'package:travel_app/page.dart';
import 'package:travel_app/vars.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    setState(() {
      r = 10;
    });
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      r = 10;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    setState(() {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    });
    configColors();
    return Scaffold(
      body: Container(
        color: primary,
        height: s.height,
        width: s.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: s.height * 0.6,
              width: s.width,
              child: PageView(
                controller: welcomeCon,
                children: [
                  Container(
                    color: Colors.red,
                  )
                ],
              ),
            ),
            Container(
              width: s.width,
              height: s.height * 0.35,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wonderful Vacation Trips!',
                    style: TextStyle(
                        fontSize: 26,
                        color: secondary,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        shadows: [Shadow(color: palette, offset: Offset(2, 2), blurRadius: 1000)]),
                  ),
                  Text(
                    'With the sea in the north,'
                    ' and the Sahara in the south, and mountains filled with ancient ruins of old'
                    ' times spread across, the nature has never been more beautiful.'
                    '\n\nCome visit and enjoy your time in the Wonderful country of Libya.',
                    style: TextStyle(fontSize: 15, color: secondary, shadows: [Shadow(color: palette, offset: Offset(2, 2), blurRadius: 1000)]),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        r = 20;
                      });
                      Navigator.of(context).push(customRoute(const Page1()));
                      setState(() {
                        r = 10;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        r = 20;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: 45,
                      width: 150,
                      decoration:
                          BoxDecoration(color: darkPalette, border: Border.all(color: secondary, width: 1), borderRadius: BorderRadius.circular((r))),
                      child: Center(
                          child: Text(
                        'Let\'s Go!',
                        style: TextStyle(fontSize: (s.height / (17.35 * 2)) - 5, height: 1, color: Colors.black),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
