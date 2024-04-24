import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonPagination {
  final int? count;
  final String? next;
  final String? previous;
  final List<Pokemon>? results;

  PokemonPagination(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

}
