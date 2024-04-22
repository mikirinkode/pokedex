import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_typography.dart';

import '../../core/theme/app_color.dart';

class PokemonTypeChip extends StatelessWidget {
  final type;
  const PokemonTypeChip({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColor.getPokemonTypeColor(type),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        type,
        style: AppTypography.subtitle3.copyWith(color: AppColor.grayscaleWhite),
      ),
    );
  }
}
