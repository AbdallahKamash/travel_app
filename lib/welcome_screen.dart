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
  bool animate = false;


  @override
  void initState() {
    setState(() {
      animate = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      animate = true;
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
      backgroundColor: primary,
      body: SizedBox(
        height: s.height,
        width: s.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: s.height * 0.6,
              width: s.width,
              decoration: BoxDecoration(
                  color: primary,
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withAlpha(60),
                      blurRadius: 100.0,
                      spreadRadius: 2.0,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(40)),
                  image: const DecorationImage(
                      image: AssetImage('lib/assets/gm.jpg'),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              width: s.width,
              height: s.height * 0.35,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Wonderful Vacation Trips!',
                    style: TextStyle(fontSize: 26, color: secondary, height: 1.2, fontWeight: FontWeight.w700,  shadows: const [
                      Shadow(
                          color: Colors.lightBlue,
                          offset: Offset(2, 2),
                          blurRadius: 1000)
                    ]),
                  ),
                   Text(
                    'With the sea in the north,'
                        ' and the Sahara in the south, and mountains filled with ancient ruins of old'
                        ' times spread across, the nature has never been more beautiful.'
                        '\n\nCome visit and enjoy your time in the Wonderful country of Libya.',
                    style: TextStyle(fontSize: 15, color: secondary, shadows: const [
                      Shadow(
                          color: Colors.lightBlue,
                          offset: Offset(2, 2),
                          blurRadius: 1000)
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(customRoute(Page1()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: s.height / 17.35,
                      width: s.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade900,
                          borderRadius:
                              BorderRadius.circular(s.height / (17.35 / 2))),
                      child: Center(
                          child: Text(
                        'Let\'s Go!',
                        style: TextStyle(
                            fontSize: (s.height / (17.35 * 2)) - 5,
                            height: 1,
                            color: Colors.white),
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
