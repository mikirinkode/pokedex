import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/presentation/state/pokemon_state.dart';

import '../../../../domain/entity/pokemon.dart';
import '../../../../domain/usecase/pokemon_usecase.dart';

class PokemonListCubit extends Cubit<PokemonState> {
  final _pageSize = 8;
  final PagingController<int, Pokemon> pagingController =
      PagingController(firstPageKey: 0);

  final PokemonUseCase _useCase;

  PokemonListCubit({required PokemonUseCase useCase})
      : _useCase = useCase,
        super(PokemonInitial()) {
    emit(PokemonLoading());
    pagingController.addPageRequestListener((pageKey) {
      getPokemonList(pageKey);
    });
  }

  Future<void> getPokemonList(int pageKey) async {
    try {
      final pagination =
          await _useCase.getPokemonList(pageKey: pageKey, pageSize: _pageSize);
      final isLastPage = pagination?.next == null;
      final List<Pokemon> result = pagination?.results ?? [];
      final totalCount = pagination?.count ?? 0;

      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        final nextPageKey = pageKey + result.length;

        pagingController.appendPage(result, nextPageKey);
      }
      emit(PokemonListLoaded(pagingController, totalCount));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
