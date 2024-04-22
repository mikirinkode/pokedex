import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_color.dart';
class AppTypography {
  //Header
  static const headline = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.grayscaleDark);
  static const subtitle1 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.grayscaleDark);
  static const subtitle2 = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.grayscaleDark);
  static const subtitle3 = TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColor.grayscaleDark);

  // Body
  static const bodyText1 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.grayscaleDark);
  static const bodyText2 = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.grayscaleDark);
  static const bodyText3 = TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: AppColor.grayscaleDark);
  static const caption = TextStyle(fontSize: 8, fontWeight: FontWeight.normal, color: AppColor.grayscaleDark);
}
