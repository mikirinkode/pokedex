import '../../domain/entity/pokemon_stat.dart';

class PokemonStatDto extends PokemonStat {

  PokemonStatDto({
    super.baseStat,
    super.stat,
  });

  factory PokemonStatDto.fromMap(Map<String, dynamic> json) {
    return PokemonStatDto(
      baseStat: json['base_stat'],
      stat: StatInfoDto.fromMap(json['stat']),
    );
  }
}

class StatInfoDto extends StatInfo {
  StatInfoDto({super.statName});

  factory StatInfoDto.fromMap(Map<String, dynamic> json) {
    return StatInfoDto(
      statName: json['name'],
    );
  }
}
