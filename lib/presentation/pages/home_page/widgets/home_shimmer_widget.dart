import 'package:flutter/material.dart';


import '../../../shared/shimmer_shape.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_elevation.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1),
      itemBuilder: (_, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.grayscaleWhite,
          boxShadow: [AppElevation.dropShadow2dp],
        ),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.grayscaleBackground,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ShimmerShape(height: 10, width: 24),
                  )),
              const Center(child: ShimmerShape(height: 62, width: 62)),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ShimmerShape(height: 16, width: 64),
                  )),
            ],
          ),
        ),
      ),
      itemCount: 20,
    );
  }
}
