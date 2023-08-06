import 'package:flutter/material.dart';
import 'package:travel_app/fade_route.dart';
import 'package:travel_app/page.dart';

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
    return Scaffold(
      backgroundColor: Colors.white, //test 1
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
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withAlpha(100),
                      blurRadius: 6.0,
                      spreadRadius: 5.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(40)),
                  image: const DecorationImage(
                      image: AssetImage('lib/assets/waterfalls.jpeg'),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              width: s.width,
              height: s.height * 0.375,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wonderful Vacation Trips!',
                    style: TextStyle(fontSize: 30, height: 1.2, shadows: [
                      Shadow(
                          color: Colors.lightBlue,
                          offset: Offset(2, 2),
                          blurRadius: 1000)
                    ]),
                  ),
                  const Text(
                    '\nEnjoy your vacation in the Green Mountain located in Eastern Libya.'
                    ' With hills meeting the seashore, the best views and nature are to be found.'
                    '\n\nEnjoy your trip and experience a trip of a lifetime.',
                    style: TextStyle(fontSize: 16, shadows: [
                      Shadow(
                          color: Colors.lightBlue,
                          offset: Offset(2, 2),
                          blurRadius: 1000)
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: InkWell(
                      onTap: () {
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page1()));
                        Navigator.push(
                            context, FadeRoute(widget: const Page1()));
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
