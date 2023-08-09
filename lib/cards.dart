import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/place_page.dart';
import 'package:travel_app/vars.dart';

import 'fade_route.dart';

Widget cards(int type, BuildContext ctx, int i, Size s) {
  return GestureDetector(
    onTap: () {
      Navigator.push(ctx, customRoute(PlacePage(place: places['destinations'][i])));
    },
    child: Container(
      margin: type == 1 ? EdgeInsets.only(left: 5, right: 5) : EdgeInsets.only(top: 5, bottom: 5),
      width: type == 0 ? (s.width / 2) - 20 : s.width / 1.25,
      height: type == 0 ? (s.width / 2) - 20 : 250,
      decoration: BoxDecoration(
          color: secondary.withOpacity(0.05), borderRadius: BorderRadius.circular(20),),
      child: Stack(
        children: [
          //cached network image
          SizedBox(
            width: type == 0 ? (s.width / 2) - 20 : s.width / 1.2,
            height: type == 0 ? (s.width / 2) - 20 : 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: places['destinations'][i]['picture'],
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Center(child: Opacity(opacity: 0.1, child: Image.asset('lib/assets/placeholder_image.png', color: secondary, scale: 4))),
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
  );
}
