class PokemonStat {
  final int? baseStat;
  final StatInfo? stat;

  PokemonStat({
    required this.baseStat,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      baseStat: json['base_stat'],
      stat: StatInfo.fromJson(json['stat']),
    );
  }
}

class StatInfo {
  final String? statName;

  StatInfo({required this.statName});

  factory StatInfo.fromJson(Map<String, dynamic> json) {
    return StatInfo(
      statName: json['name'],
    );
  }
}
