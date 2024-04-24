class PokemonAbility {
  final AbilityInfo? ability;

  PokemonAbility({required this.ability});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      ability: AbilityInfo.fromJson(json['ability']),
    );
  }
}

class AbilityInfo {
  final String? abilityName;

  AbilityInfo({required this.abilityName});

  factory AbilityInfo.fromJson(Map<String, dynamic> json) {
    return AbilityInfo(
      abilityName: json['name'],
    );
  }
}