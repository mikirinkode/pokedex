import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/state/pokemon_state.dart';

import '../../../../domain/usecase/pokemon_usecase.dart';

class PokemonDetailCubit extends Cubit<PokemonState> {
  final PokemonUseCase _useCase;

  PokemonDetailCubit({required PokemonUseCase useCase})
      : _useCase = useCase,
        super(PokemonInitial());

  Future<void> getPokemonDetail(int id) async {
    try {
      emit(PokemonLoading());
      final result = await _useCase.getPokemonDetail(pokemonId: id);
      emit(PokemonDetailLoaded(result));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
