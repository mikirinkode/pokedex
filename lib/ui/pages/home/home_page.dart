import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/bloc/pokemon/pokemon_cubit.dart';
import 'package:pokedex/bloc/pokemon/pokemon_detail_cubit.dart';
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex/core/theme/app_typography.dart';
import 'package:pokedex/ui/pages/detail/detail_page.dart';
import 'package:pokedex/ui/pages/home/widgets/home_shimmer_widget.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_elevation.dart';
import '../../../data/models/pokemon_model.dart';
import '../../global_widgets/error_message_widget.dart';
import 'widgets/pokemon_card.dart';
import 'widgets/pokemon_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        titleSpacing: 0,
        leading: Container(
          width: 16,
          height: 16,
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            width: 16,
            height: 16,
            "assets/icons/pokeball.png",
            color: AppColor.grayscaleWhite,
          ),
        ),
        title: Text(
          "Pokédex",
          style: AppTypography.headline,
        ),
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = PokemonListCubit();
          cubit.getPokemonList(0);
          return cubit;
        },
        child: Column(
          children: [
            PokemonSearchBar(
              onSortTapped: () {},
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      boxShadow: AppElevation.innerShadow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BlocBuilder<PokemonListCubit, PokemonState>(
                      builder: (context, state) {
                        if (state is PokemonLoading) {
                          return const HomeShimmerWidget();
                        } else if (state is PokemonError) {
                          return Center(
                            child: ErrorMessageWidget(
                              errorMessage: state.message,
                            ),
                          );
                        } else if (state is PokemonListLoaded) {
                          return PagedGridView<int, PokemonModel>(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 12),
                            physics: const BouncingScrollPhysics(),
                            pagingController: state.controller,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 1),
                            builderDelegate:
                                PagedChildBuilderDelegate<PokemonModel>(
                                    itemBuilder: (context, item, index) {
                              return PokemonCard(
                                pokemon: item,
                                onTapped: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider.value(
                                                value: BlocProvider.of<
                                                    PokemonDetailCubit>(context)
                                                  ..getPokemonDetail(
                                                      item.getId()),
                                                child: DetailPage(
                                                    pokemonId: item.getId(),
                                                    totalCount:
                                                        state.totalCount,
                                                    index: index + 1),
                                              )));
                                },
                              );
                            }),
                          );
                        } else {
                          return Container();
                        }
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
