import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';

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
