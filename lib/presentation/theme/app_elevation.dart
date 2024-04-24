import 'package:flutter/material.dart';

import 'app_color.dart';

class AppElevation {
  static BoxShadow dropShadow2dp = BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static BoxShadow dropShadow6dp = BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 3,
    blurRadius: 12,
    offset: const Offset(0, 3), // changes position of shadow
  );

  static BoxShadow innerShadow2dp = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0, 1), // changes position of shadow
  );

  static List<BoxShadow> innerShadow = [
    const BoxShadow(
      color: AppColor.grayscaleLight,
    ),
    const BoxShadow(
      offset: Offset(0, 1),
      color: Colors.white,
      spreadRadius: -1,
      blurRadius: 0.5,
    ),
  ];
}