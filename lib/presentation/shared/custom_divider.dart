import 'package:flutter/material.dart';

import '../theme/app_color.dart';

Widget CustomDivider() {
  return Center(
    child: Container(
      width: 1,
      decoration: const BoxDecoration(
        color: AppColor.grayscaleLight,
        shape: BoxShape.rectangle,
      ),
    ),
  );
}
