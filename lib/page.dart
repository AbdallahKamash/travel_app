
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/no_glow_view.dart';
import 'package:travel_app/vars.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  Future<void> getData() {
    return rootBundle.loadString('assets/data.json').then((value) {
      setState(() {
        places = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final top = MediaQuery.of(context).viewPadding.top;
    getData();
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
        child: Stack(
          children: [
            PageView(
              controller: page1Con,
              scrollBehavior: NoGlow(),
              children: [
                Container(
                  margin: EdgeInsets.only(top: top + 50),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: ListView(
                      children: [
                        Container(
                          height: 45,
                          color: primary,
                          child: // slide bar with tabs
                              ScrollConfiguration(
                                behavior: NoGlow(),
                                child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(tabs.length, (index) {
                                return Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  margin: EdgeInsets.only(left: index == 0 ? 8 : 0, right: 8, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    // shadows
                                    boxShadow: [
                                      BoxShadow(
                                        color: secondary.withAlpha(60),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      tabs[index],
                                      style: TextStyle(
                                        color: secondary,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                );
                            }),
                          ),
                              )
                        ),
                        Container(
                          height: 250,
                          color: primary,
                          child:
                              ScrollConfiguration(
                                behavior: NoGlow(),
                                child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(3, (index) {
                                return Container(
                                  height: 200,
                                  width: 300,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: primary,
                                    // shadows
                                    boxShadow: [
                                      BoxShadow(
                                        color: secondary.withAlpha(60),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                );
                            }),
                          ),
                              )
                        ),
                        Container(
                          color: primary,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                height: 45,
                                width: s.width,
                                child: Text(
                                  'Recommended',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              for(int i = 0; i < ((places.length/2).floor()); i++)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Text(''),
                                        width: s.width / 2 - 20,
                                        height: s.width / 2 - 20,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          // shadows
                                          boxShadow: [
                                            BoxShadow(
                                              color: secondary.withAlpha(60),
                                              blurRadius: 2.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      Container(
                                        width: s.width / 2 - 20,
                                        height: s.width / 2 - 20,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          // shadows
                                          boxShadow: [
                                            BoxShadow(
                                              color: secondary.withAlpha(60),
                                              blurRadius: 2.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (places.length%2 == 1)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: s.width / 2 - 20,
                                        height: s.width / 2 - 20,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          // shadows
                                          boxShadow: [
                                            BoxShadow(
                                              color: secondary.withAlpha(60),
                                              blurRadius: 2.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
            // Bottom Nav bar
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                width: s.width - 20,
                height: 80,
                decoration: BoxDecoration(
                  //shadow
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withAlpha(isDarkMode ? 30 : 60),
                      blurRadius: 25.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Top Name bar
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: top),
                width: s.width,
                height: 90,
                decoration: BoxDecoration(
                  //shadow
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withAlpha(30),
                      blurRadius: 0,
                      spreadRadius: 2.0,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                  color: primary,
                ),
                child: Center(
                  child: Text(
                    'Travel App',
                    style: TextStyle(
                      color: secondary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
