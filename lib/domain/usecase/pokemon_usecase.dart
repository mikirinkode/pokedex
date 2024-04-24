import 'package:pokedex/domain/repository/pokemon_repository.dart';

import '../entity/pokemon_detail.dart';
import '../entity/pokemon_pagination.dart';

class PokemonUseCase {
  PokemonUseCase({
    required PokemonRepository repository,
  }) : _repository = repository;

  final PokemonRepository _repository;

  Future<PokemonPagination?> getPokemonList(
          {int pageKey = 0, int pageSize = 8}) =>
      _repository.getPokemonList(pageKey: pageKey, pageSize: pageSize);

  Future<PokemonDetail> getPokemonDetail({int pokemonId = 0}) =>
      _repository.getPokemonDetail(pokemonId: pokemonId);
}
