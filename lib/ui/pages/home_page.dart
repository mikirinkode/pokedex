import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon/pokemon_cubit.dart';
import 'package:pokedex/bloc/pokemon/pokemon_detail_cubit.dart';
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/pages/detail_page.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/app_elevation.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';

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
        ),
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = PokemonListCubit();
          cubit.getPokemonList();
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
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PokemonError) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else if (state is PokemonListLoaded) {
                          return GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 12),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 1),
                            itemBuilder: (_, index) => PokemonCard(
                              pokemon: state.pokemonList.elementAt(index),
                              onTapped: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                              value: BlocProvider.of<
                                                  PokemonDetailCubit>(context)
                                                ..getPokemonDetail(state
                                                    .pokemonList[index]
                                                    .getId()),
                                              child: DetailPage(),
                                            )));
                              },
                            ),
                            itemCount: state.pokemonList.length,
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
