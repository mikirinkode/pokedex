import 'package:flutter/material.dart';
import 'package:pokedex/utils/text_utils.dart';
import 'package:pokedex/presentation/theme/app_elevation.dart';
import 'package:pokedex/presentation/theme/app_typography.dart';
import '../../../../domain/entity/pokemon.dart';
import '../../../shared/pokemon_image_widget.dart';
import '../../../theme/app_color.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

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
                        imageUrl: pokemon.getImageUrl(),
                        fgColor: AppColor.grayscaleMedium,
                        bgColor: AppColor.grayscaleLight,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          TextUtils.capitalizeFirst(pokemon.name ?? ""),
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
