import 'package:flutter/material.dart';
import 'package:travel_app/vars.dart';

class PlacePage extends StatelessWidget {
  var place;

  PlacePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Text('${place['name']}', style: TextStyle(color: secondary),),
      ),
    );
  }
}

