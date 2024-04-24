import 'dart:convert';

import 'package:pokedex/data/dto/pokemon_dto.dart';
import 'package:pokedex/domain/entity/pokemon.dart';
import 'package:pokedex/domain/entity/pokemon_pagination.dart';

class PokemonPaginationDto extends PokemonPagination {
  PokemonPaginationDto(
      {super.count, super.next, super.previous, super.results});

  factory PokemonPaginationDto.fromRawJson(String str) =>
      PokemonPaginationDto.fromMap(json.decode(str));

  factory PokemonPaginationDto.fromMap(Map<String, dynamic> json) {
    return PokemonPaginationDto(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Pokemon>.from(
          json['results'].map((model) => PokemonDto.fromMap(model))),
    );
  }
}
