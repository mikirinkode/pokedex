import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/app_color.dart';

class ShimmerShape extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerShape({required this.width, required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.grayscaleLoading,
        highlightColor: AppColor.grayscaleWhite,
        child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
        color: AppColor.grayscaleLoading,
        borderRadius: BorderRadius.circular(8)),
    ));
  }
}