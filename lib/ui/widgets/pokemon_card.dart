import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_elevation.dart';
import 'package:pokedex/core/theme/app_typography.dart';
import 'package:pokedex/ui/widgets/pokemon_image_widget.dart';

import '../../core/theme/app_color.dart';
import '../../data/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  final Function() onTapped;

  const PokemonCard({required this.pokemon, required this.onTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.grayscaleWhite,
          boxShadow: [AppElevation.dropShadow2dp],
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: AppColor.grayscaleBackground,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          pokemon.getPaddedIndex(),
                          style: AppTypography.caption.copyWith(
                            color: AppColor.grayscaleMedium,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    Center(
                      child: PokemonImageWidget(
                          size: 72,
                          imageUrl: pokemon.getImageUrl()),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          pokemon.getName(),
                          style: AppTypography.bodyText3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
