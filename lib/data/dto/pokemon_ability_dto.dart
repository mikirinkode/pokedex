import 'package:pokedex/domain/entity/pokemon_ability.dart';

class PokemonAbilityDto extends PokemonAbility {

  PokemonAbilityDto({super.ability});

  factory PokemonAbilityDto.fromMap(Map<String, dynamic> json) {
    return PokemonAbilityDto(
      ability: AbilityInfoDto.fromMap(json['ability']),
    );
  }
}

class AbilityInfoDto extends AbilityInfo {

  AbilityInfoDto({super.abilityName});

  factory AbilityInfoDto.fromMap(Map<String, dynamic> json) {
    return AbilityInfoDto(
      abilityName: json['name'],
    );
  }
}