import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/fade_route.dart';
import 'package:travel_app/no_glow_view.dart';
import 'package:travel_app/place_page.dart';
import 'package:travel_app/vars.dart';

import 'cards.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    page1Con = PageController(initialPage: 0);
    activeTab = 0;
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    page1Con.dispose();
    places == null;
    activeTab = 0;
    super.dispose();
  }

  Future<String> loadJsonData() async {
    String jsonString = await rootBundle.loadString('lib/assets/fake_data.json');
    return jsonString;
  }

  void fetchData() async {
    String jsonData = await loadJsonData();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        places = json.decode(jsonData);
      });
    });
    // Do something with the data
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final top = MediaQuery.of(context).viewPadding.top;
    setState(() {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    });
    configColors();
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        color: secondary.withOpacity(0.05),
        height: s.height,
        width: s.width,
        child: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  pageNum = index;
                });
              },
              controller: page1Con,
              scrollBehavior: NoGlow(),
              children: [
                Container(
                  margin: EdgeInsets.only(top: top + 50),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: RefreshIndicator(
                      triggerMode: RefreshIndicatorTriggerMode.onEdge,
                      color: darkPalette,
                      backgroundColor: primary,
                      onRefresh: () async {
                        fetchData();
                      },
                      child: ListView(
                        children: [
                          Container(
                              height: 45,
                              child: // slide bar with tabs
                                  ScrollConfiguration(
                                behavior: NoGlow(),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(tabs.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          activeTab = index;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        margin: EdgeInsets.only(left: index == 0 ? 8 : 0, right: 8, top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          color: activeTab == index ? lightPalette : Colors.transparent,
                                          border: Border.all(
                                            color: activeTab == index ? primary : Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            tabs[index],
                                            style: TextStyle(
                                              color: isDarkMode && activeTab == index ? primary : secondary,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )),
                          Container(
                            height: 250,
                            child: ScrollConfiguration(
                              behavior: NoGlow(),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for(int i = 0; i < 5; i++)
                                    cards(1, context, i, s)
                                ],
                              ),
                            ),
                          ),
                          Container(
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
                                if (places == null)
                                  //circular loading sign
                                  SizedBox(
                                    height: 200,
                                    width: s.width,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: palette,
                                        backgroundColor: secondary,
                                      ),
                                    ),
                                  ),
                                if (places != null)
                                  for (int i = 0; i < ((places['destinations']!.length / 2).floor()); i++)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [cards(0, context, i, s), cards(0, context, i + 1, s)],
                                    ),
                                if (places != null)
                                  if (places['destinations']!.length % 2 == 1)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context, customRoute(PlacePage(place: places['destinations'][places['destinations']!.length - 1])));
                                      },
                                      child: Container(
                                        width: (s.width / 2) - 20,
                                        height: (s.width / 2) - 20,
                                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          color: secondary.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          children: [
                                            //cached network image
                                            SizedBox(
                                              width: (s.width / 2) - 20,
                                              height: (s.width / 2) - 20,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                  imageUrl: places['destinations'][places['destinations']!.length - 1]['picture'],
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, url, error) => Center(
                                                      child: Opacity(
                                                          opacity: 0.1,
                                                          child: Image.asset('lib/assets/placeholder_image.png', color: secondary, scale: 4))),
                                                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                                    child: CircularProgressIndicator(
                                                      color: palette,
                                                      backgroundColor: secondary,
                                                      value: downloadProgress.progress,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                const SizedBox(
                                  height: 90,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
            // Bottom Nav bar
            Positioned(
              bottom: 10,
              left: 30,
              child: Container(
                width: s.width - 60,
                height: 70,
                decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: secondary.withOpacity(0.1), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    navItem(0, Icons.home),
                    navItem(1, Icons.search_rounded),
                    navItem(2, Icons.calendar_month),
                    navItem(3, Icons.person),
                  ],
                )),
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
                  border: Border(
                    bottom: BorderSide(
                      color: secondary.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
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

  Widget navItem(int num, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageNum = num;
        });
        //change pageController to page num
        page1Con.animateToPage(
          pageNum,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setState(() {
          pageNum = num;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: pageNum == num ? 50 : 35,
        width: pageNum == num ? 50 : 35,
        decoration: BoxDecoration(
          color: pageNum == num ? darkPalette : primary,
          borderRadius: BorderRadius.circular(r),
          border: Border.all(color: pageNum == num ? secondary : primary, width: 1),
        ),
        child: Center(
          child: Icon(
            icon,
            color: secondary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
