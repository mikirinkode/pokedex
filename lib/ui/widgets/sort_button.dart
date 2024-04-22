import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/app_elevation.dart';

class SortButton extends StatelessWidget {

  final Function() onSortTapped;

  const SortButton({required this.onSortTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSortTapped,
      child: Container(
        decoration: BoxDecoration(
            // color: AppColor.grayscaleWhite,
            shape: BoxShape.circle,
            boxShadow: AppElevation.innerShadow),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 18,
          child: Image.asset(
            "assets/icons/sort.png",
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
