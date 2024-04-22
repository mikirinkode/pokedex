import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_elevation.dart';
import 'package:pokedex/core/theme/app_typography.dart';

import '../../core/theme/app_color.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
        color: AppColor.grayscaleWhite,
        boxShadow: [
          AppElevation.dropShadow2dp
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color: AppColor.grayscaleBackground,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "#999",
                    style:
                    AppTypography.caption.copyWith(color: AppColor.grayscaleMedium, ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                  width: 72,
                  height: 72,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 72,
                      height: 72,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  "Pokemon Name",
                  style: AppTypography.bodyText3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
