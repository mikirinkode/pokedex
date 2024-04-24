import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/pages/detail_page/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/presentation/state/pokemon_state.dart';
import 'package:pokedex/presentation/theme/app_typography.dart';
import 'package:pokedex/utils/text_utils.dart';

import '../../../../domain/entity/pokemon_detail.dart';
import '../../../../domain/entity/pokemon_type.dart';
import '../../../shared/custom_divider.dart';
import '../../../shared/pokemon_image_widget.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_elevation.dart';
import '../widgets/detail_error_widget.dart';
import '../widgets/detail_shimmer_widget.dart';
import '../widgets/pokemon_type_chip.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class DetailPage extends StatelessWidget {
  final int pokemonId;
  final int totalCount;
  final int index;

  const DetailPage(
      {required this.pokemonId,
      required this.totalCount,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grayscaleWhite,
      child: BlocBuilder<PokemonDetailCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const DetailShimmerWidget();
          } else if (state is PokemonError) {
            return DetailPageErrorWidget(errorMessage: state.message);
          } else if (state is PokemonDetailLoaded) {
            return _DetailPageContent(
                pokemon: state.pokemon,
                pokemonId: pokemonId,
                totalCount: totalCount,
                index: index);
          }
          // Default return statement
          return Container();
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Content
// -----------------------------------------------------------------------------
class _DetailPageContent extends StatelessWidget {
  final PokemonDetail pokemon;
  final int pokemonId;
  final int totalCount;
  final int index;

  const _DetailPageContent(
      {required this.pokemon,
      required this.pokemonId,
      required this.totalCount,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.getPokemonTypeColor(pokemon.getPokemonType()),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: detailPageAppBar(
                    name: TextUtils.capitalizeFirst(pokemon.name ?? ""),
                    id: pokemon.getFormattedId(),
                    onBackPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Positioned.fill(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topRight,
                    height: 200,
                    child: Image.asset("assets/icons/pokeball.png",
                        opacity: const AlwaysStoppedAnimation(.1)))),
            Positioned.fill(
                child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                navigationRow(context),
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
                top: 100, child: pokemonDetailInfoWidget(pokemon: pokemon)),
          ],
        ),
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

  Widget navigationRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: (pokemonId > 1)
                ? Center(
                    child: IconButton(
                      onPressed: () {
                        _changeDetailData(
                            context: context,
                            newPokemonId: pokemonId - 1,
                            newIndex: index - 1);
                      },
                      icon: Image.asset("assets/icons/chevron_left.png",
                          height: 32, color: AppColor.grayscaleWhite),
                    ),
                  )
                : Container()),
        Expanded(child: Container()),
        Expanded(
            child: (index < totalCount)
                ? Center(
                    child: IconButton(
                      onPressed: () {
                        _changeDetailData(
                            context: context,
                            newPokemonId: pokemonId + 1,
                            newIndex: index + 1);
                      },
                      icon: Image.asset("assets/icons/chevron_right.png",
                          height: 32, color: AppColor.grayscaleWhite),
                    ),
                  )
                : Container()),
      ],
    );
  }

  void _changeDetailData(
      {required BuildContext context,
      required int newPokemonId,
      required int newIndex}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<PokemonDetailCubit>(context)
            ..getPokemonDetail(newPokemonId),
          child: DetailPage(
              pokemonId: newPokemonId,
              totalCount: totalCount,
              index: newIndex),
        ),
      ),
    );
  }

  Widget pokemonDetailInfoWidget({required PokemonDetail pokemon}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonImageWidget(
            size: 200,
            imageUrl: pokemon.getImageUrl(),
            fgColor: AppColor.getPokemonTypeColor(pokemon.getPokemonType()),
            bgColor: AppColor.getPokemonTypeColor(pokemon.getPokemonType())
                .withOpacity(0.2),
          ),
          pokemonTypeRow(types: pokemon.types),
          const SizedBox(
            height: 16,
          ),
          pokemonSection(
            title: "About",
            pokemonType: pokemon.getPokemonType(),
            body: IntrinsicHeight(
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
          ),
          pokemonSection(
              title: "Base Stats",
              pokemonType: pokemon.getPokemonType(),
              body: Column(
                children: pokemon
                    .getStatMap()
                    .entries
                    .map((e) => pokemonBaseStatsRow(
                        title: pokemon.getTypeName(e.key),
                        value: e.value,
                        pokemonType: pokemon.getPokemonType()))
                    .toList(),
              )),
        ],
      ),
    );
  }

  Widget pokemonTypeRow({required List<PokemonType>? types}) {
    return (types != null)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: types
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PokemonTypeChip(type: e.type?.typeName ?? ""),
                    ))
                .toList(),
          )
        : Container();
  }

  Widget pokemonSection(
      {required String title,
      required String pokemonType,
      required Widget body}) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          title,
          style: AppTypography.subtitle1
              .copyWith(color: AppColor.getPokemonTypeColor(pokemonType)),
        ),
        const SizedBox(
          height: 16,
        ),
        body
      ],
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
                      SizedBox(height: 16, child: Image.asset(iconPath)),
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
    return IntrinsicHeight(
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
          Text(value.toString().padLeft(3, '0'),
              style: AppTypography.bodyText3),
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
          )),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
