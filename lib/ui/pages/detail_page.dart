import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon/pokemon_detail_cubit.dart';
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex/core/theme/app_typography.dart';
import 'package:pokedex/core/values/pokemon_type_constants.dart';
import 'package:pokedex/ui/widgets/pokemon_type_chip.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/app_elevation.dart';
import '../../data/models/pokemon_detail_model.dart';
import '../widgets/custom_divider.dart';
import '../widgets/pokemon_image_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grayscaleWhite,
      child: BlocBuilder<PokemonDetailCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/icons/arrow_back.png",
                          color: AppColor.grayscaleDark,
                          height: 24,
                        )),
                  ),
                  Expanded(child: Center(child: CircularProgressIndicator())),
                ],
              ),
            );
          } else if (state is PokemonError) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/icons/arrow_back.png",
                          color: AppColor.grayscaleDark,
                          height: 24,
                        )),
                  ),
                  Expanded(child: Center(child: Column(
                    children: [
                      const Icon(Icons.error, color: AppColor.primary, size: 50,),
                      const SizedBox(height: 24,),
                      const Text("Terjadi Kesalahan", style: AppTypography.subtitle1),
                      const SizedBox(height: 8,),
                      Text(state.message),
                    ],
                  ))),
                ],
              ),
            );
          } else if (state is PokemonDetailLoaded) {
            return Scaffold(
              backgroundColor:
                  AppColor.getPokemonTypeColor(state.pokemon.getPokemonType()),
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: detailPageAppBar(
                            name: state.pokemon.getName(),
                            id: state.pokemon.getFormattedId(),
                            onBackPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                    Positioned.fill(
                        child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topRight,
                            height: 200,
                            child: Image.asset("assets/icons/pokeball.png",
                                opacity: const AlwaysStoppedAnimation(.1))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                decoration: BoxDecoration(
                              boxShadow: AppElevation.innerShadow,
                              borderRadius: BorderRadius.circular(8),
                            )),
                          ),
                        )
                      ],
                    )),
                    Positioned.fill(
                        top: 100, child: detailContent(pokemon: state.pokemon)),
                  ],
                ),
              ),
            );
          }
          // Default return statement
          return Container();
        },
      ),
    );
  }

  Widget detailPageAppBar(
      {required name, required id, required Function() onBackPressed}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
            onPressed: onBackPressed,
            icon: Image.asset(
              "assets/icons/arrow_back.png",
              color: AppColor.grayscaleWhite,
              height: 24,
            )),
        Expanded(
          child: Text(
            name,
            style:
                AppTypography.headline.copyWith(color: AppColor.grayscaleWhite),
          ),
        ),
        Text(
          id,
          style:
              AppTypography.subtitle2.copyWith(color: AppColor.grayscaleWhite),
        ),
        const SizedBox(width: 16)
      ],
    );
  }

  Widget detailContent({required PokemonDetailModel pokemon}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonImageWidget(size: 200, imageUrl: pokemon.getImageUrl()),
          (pokemon.types != null)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: pokemon.types!
                      .map((e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: PokemonTypeChip(type: e.type.typeName),
                          ))
                      .toList(),
                )
              : Container(),
          const SizedBox(
            height: 16,
          ),
          Text(
            "About",
            style: AppTypography.subtitle1.copyWith(
                color: AppColor.getPokemonTypeColor(pokemon.getPokemonType())),
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
                      value: pokemon.getWeight(),
                      iconPath: "assets/icons/weight.png"),
                ),
                CustomDivider(),
                Expanded(
                  child: pokemonAboutWidget(
                      title: "Height",
                      value: pokemon.getHeight(),
                      iconPath: "assets/icons/straighten.png"),
                ),
                CustomDivider(),
                Expanded(
                  child: pokemonAboutWidget(
                      title: "Moves",
                      value: pokemon.getAbilities(),
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
                color: AppColor.getPokemonTypeColor(pokemon.getPokemonType())),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: pokemon
                .getStatMap()
                .entries
                .map((e) => pokemonBaseStatsRow(
                    title: pokemon.getTypeName(e.key),
                    value: e.value,
                    pokemonType: pokemon.getPokemonType()))
                .toList(),
          )
        ],
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
              backgroundColor:
                  AppColor.getPokemonTypeColor(pokemonType).withOpacity(0.2),
              value: (value / 200),
              borderRadius: BorderRadius.circular(16),
            ))
          ],
        ),
      ),
    );
  }
}
