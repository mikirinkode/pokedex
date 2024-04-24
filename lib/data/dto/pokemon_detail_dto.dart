import 'dart:convert';

import 'package:pokedex/data/dto/pokemon_ability_dto.dart';
import 'package:pokedex/data/dto/pokemon_stat_dto.dart';
import 'package:pokedex/data/dto/pokemon_type_dto.dart';
import 'package:pokedex/domain/entity/pokemon_detail.dart';

class PokemonDetailDto extends PokemonDetail{

  PokemonDetailDto({
    super.name,
    super.id,
    super.height,
    super.weight,
    super.stats,
    super.abilities,
    super.types,
  });

  factory PokemonDetailDto.fromRawJson(String str) =>
      PokemonDetailDto.fromMap(json.decode(str));

  factory PokemonDetailDto.fromMap(Map<String, dynamic> json) {
    return PokemonDetailDto(
      name: json['name'],
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      stats: List<PokemonStatDto>.from(
          json['stats'].map((model) => PokemonStatDto.fromMap(model))),
      types: List<PokemonTypeDto>.from(
          json['types'].map((model) => PokemonTypeDto.fromMap(model))),
      abilities: List<PokemonAbilityDto>.from(json['abilities']
          .map((model) => PokemonAbilityDto.fromMap(model))),
    );
  }
}
