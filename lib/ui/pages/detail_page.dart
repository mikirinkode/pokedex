import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_typography.dart';
import 'package:pokedex/core/values/pokemon_type_constants.dart';
import 'package:pokedex/ui/widgets/pokemon_type_chip.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/app_elevation.dart';
import '../widgets/custom_divider.dart';
import '../widgets/pokemon_image_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppColor.getPokemonTypeColor(PokemonType.typeGrass),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Bulbasaur"),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "#001",
              style: AppTypography.subtitle2
                  .copyWith(color: AppColor.grayscaleWhite),
            ),
          )
        ],
      ),
      body: detailContent(),
    );
  }

  Widget detailContent() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppElevation.innerShadow,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.only(top: 56, right: 20, left: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PokemonImageWidget(size: 200, imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
            Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PokemonTypeChip(
                        type: PokemonType.typeGrass,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      PokemonTypeChip(
                        type: PokemonType.typePoison,
                      ),
                    ],
                  ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "About",
              style: AppTypography.subtitle1.copyWith(
                  color:
                      AppColor.getPokemonTypeColor(PokemonType.typeGrass)),
            ),
            const SizedBox(
              height: 24,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: pokemonAboutWidget(
                        title: "Weight",
                        value: "6.9 kg",
                        iconPath: "assets/icons/weight.png"),
                  ),
                  CustomDivider(),
                  Expanded(
                    child: pokemonAboutWidget(
                        title: "Height",
                        value: "0.7 m",
                        iconPath: "assets/icons/straighten.png"),
                  ),
                  CustomDivider(),
                  Expanded(
                    child: pokemonAboutWidget(
                        title: "Moves",
                        value: "Chlorohyll\nOvergrow",
                        iconPath: null),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
              style: AppTypography.bodyText3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Base Stats",
              style: AppTypography.subtitle1.copyWith(
                  color:
                      AppColor.getPokemonTypeColor(PokemonType.typeGrass)),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                pokemonBaseStatsRow(
                    title: "HP",
                    value: 59,
                    pokemonType: PokemonType.typeGrass),
                pokemonBaseStatsRow(
                    title: "ATK",
                    value: 49,
                    pokemonType: PokemonType.typeGrass),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget pokemonAboutWidget(
      {required String title,
      required String value,
      required String? iconPath}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (iconPath == null)
                ? Container()
                : Row(
                    children: [
                      Container(height: 16, child: Image.asset(iconPath)),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
            Flexible(
                child: Text(
              value,
              style: AppTypography.bodyText3,
              textAlign: TextAlign.center,
            ))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title, style: AppTypography.caption)
      ],
    );
  }

  Widget pokemonBaseStatsRow(
      {required String title,
      required int value,
      required String pokemonType}) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 42,
              child: Text(
                title,
                style: AppTypography.subtitle3
                    .copyWith(color: AppColor.getPokemonTypeColor(pokemonType)),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomDivider(),
            const SizedBox(
              width: 8,
            ),
            Text("$value", style: AppTypography.bodyText3),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: LinearProgressIndicator(
              color: AppColor.getPokemonTypeColor(pokemonType),
              value: 0.5,
              borderRadius: BorderRadius.circular(16),
            ))
          ],
        ),
      ),
    );
  }
}
