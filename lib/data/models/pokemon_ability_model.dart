class PokemonAbilityModel {
  final AbilityInfo ability;

  PokemonAbilityModel({required this.ability});

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      ability: AbilityInfo.fromJson(json['ability']),
    );
  }
}

class AbilityInfo {
  final String abilityName;

  AbilityInfo({required this.abilityName});

  factory AbilityInfo.fromJson(Map<String, dynamic> json) {
    return AbilityInfo(
      abilityName: json['name'],
    );
  }
}