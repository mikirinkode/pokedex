class PokemonStatModel {
  final int baseStat;
  final StatInfo stat;

  PokemonStatModel({
    required this.baseStat,
    required this.stat,
  });

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
      baseStat: json['base_stat'],
      stat: StatInfo.fromJson(json['stat']),
    );
  }
}

class StatInfo {
  final String statName;

  StatInfo({required this.statName});

  factory StatInfo.fromJson(Map<String, dynamic> json) {
    return StatInfo(
      statName: json['name'],
    );
  }
}
