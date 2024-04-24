import 'package:pokedex/domain/entity/pokemon_detail.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

import '../domain/entity/pokemon_pagination.dart';
import 'network/api.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final Api _api;

  PokemonRepositoryImpl({
    required Api api,
  }) : _api = api;

  @override
  Future<PokemonPagination?> getPokemonList(
      {int pageKey = 0, int pageSize = 8}) {
    return _api.getPokemonList(pageKey: pageKey, pageSize: pageSize);
  }

  @override
  Future<PokemonDetail> getPokemonDetail({int pokemonId = 0}) {
    return _api.getPokemonDetail(pokemonId: pokemonId);
  }
}
