import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/domain/usecase/pokemon_usecase.dart';
import 'package:pokedex/presentation/pages/detail_page/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/presentation/state/pokemon_state.dart';
import 'package:pokedex/presentation/theme/app_typography.dart';

import '../../../../domain/entity/pokemon.dart';
import '../../../shared/error_message_widget.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_elevation.dart';
import '../../detail_page/view/detail_page.dart';
import '../cubit/pokemon_list_cubit.dart';
import '../widgets/home_shimmer_widget.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
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
          final cubit =
              PokemonListCubit(useCase: context.read<PokemonUseCase>());
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
                          return _HomeContent(totalCount: state.totalCount);
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

// -----------------------------------------------------------------------------
// Content
// -----------------------------------------------------------------------------
class _HomeContent extends StatefulWidget {
  final int totalCount;

  const _HomeContent({required this.totalCount});

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  PokemonListCubit get pageCubit => context.read<PokemonListCubit>();

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Pokemon>(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      physics: const BouncingScrollPhysics(),
      pagingController: pageCubit.pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1),
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
          itemBuilder: (context, item, index) {
        return PokemonCard(
          pokemon: item,
          onTapped: () {
            _goToDetails(
                pokemonId: item.getId(),
                totalCount: widget.totalCount,
                index: index);
          },
        );
      }),
    );
  }

  void _goToDetails(
      {required int pokemonId, required int totalCount, required int index}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<PokemonDetailCubit>(context)
                    ..getPokemonDetail(pokemonId),
                  child: DetailPage(
                      pokemonId: pokemonId,
                      totalCount: totalCount,
                      index: index + 1),
                )));
  }
  
  @override
  void dispose() {
    pageCubit.pagingController.dispose();
    super.dispose();
  }
}
