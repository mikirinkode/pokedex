import 'package:pokedex/domain/entity/pokemon_pagination.dart';

import '../entity/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<PokemonPagination?> getPokemonList(
      {int pageKey = 0, int pageSize = 8});

  Future<PokemonDetail> getPokemonDetail({int pokemonId = 0});
}