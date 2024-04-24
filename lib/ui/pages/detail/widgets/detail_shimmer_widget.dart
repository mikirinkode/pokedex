import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_elevation.dart';
import '../../../global_widgets/shimmer_shape.dart';

class DetailShimmerWidget extends StatelessWidget {
  const DetailShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grayscaleLight,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topRight,
                    height: 200,
                    child: Image.asset("assets/icons/pokeball.png",
                        opacity: const AlwaysStoppedAnimation(.1)))),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "assets/icons/arrow_back.png",
                      color: AppColor.grayscaleWhite,
                      height: 24,
                    )),
                const ShimmerShape(width: 128, height: 24),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShimmerShape(width: 32, height: 18),
                )
              ],
            ),
            Positioned.fill(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: AppElevation.innerShadow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Positioned.fill(
              top: 100,
              child: Column(
                children: [
                  const ShimmerShape(width: 200, height: 200),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerShape(width: 64, height: 24),
                      SizedBox(
                        width: 16,
                      ),
                      ShimmerShape(width: 64, height: 24),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ShimmerShape(width: 64, height: 24),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerShape(width: 108, height: 72),
                      SizedBox(width: 8,),
                      ShimmerShape(width: 108, height: 72),
                      SizedBox(width: 8,),
                      ShimmerShape(width: 108, height: 72),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ShimmerShape(width: 64, height: 24),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: List.generate(6, (index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                      child: Row(
                        children: [
                          ShimmerShape(width: 32, height: 12),
                          SizedBox(width: 4,),
                          ShimmerShape(width: 32, height: 12),
                          SizedBox(width: 4,),
                          Expanded(child: ShimmerShape(width: 32, height: 8)),
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
