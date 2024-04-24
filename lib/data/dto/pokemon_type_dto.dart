import 'package:pokedex/domain/entity/pokemon_type.dart';

class PokemonTypeDto extends PokemonType {

  PokemonTypeDto({super.type});

  factory PokemonTypeDto.fromMap(Map<String, dynamic> json) {
    return PokemonTypeDto(
      type: TypeInfoDto.fromMap(json['type']),
    );
  }
}

class TypeInfoDto extends TypeInfo{

  TypeInfoDto({super.typeName});

  factory TypeInfoDto.fromMap(Map<String, dynamic> json) {
    return TypeInfoDto(
      typeName: json['name'],
    );
  }
}