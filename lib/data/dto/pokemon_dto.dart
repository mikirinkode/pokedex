import 'dart:convert';

import 'package:pokedex/domain/entity/pokemon.dart';

class PokemonDto extends Pokemon {
  PokemonDto({
    super.name,
    super.url,
  });

  factory PokemonDto.fromRawJson(String text) => PokemonDto.fromMap(
      json.decode(text));

  factory PokemonDto.fromMap(Map<String, dynamic> json) {
    return PokemonDto(
      name: json['name'],
      url: json['url'],
    );
  }
}