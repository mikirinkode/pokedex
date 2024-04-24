import 'package:pokedex/utils/text_utils.dart';
import 'package:pokedex/utils/pokemon_type_constants.dart';
import 'package:pokedex/utils/url_constants.dart';
import 'package:pokedex/domain/entity/pokemon_ability.dart';
import 'package:pokedex/domain/entity/pokemon_stat.dart';
import 'package:pokedex/domain/entity/pokemon_type.dart';

class PokemonDetail {
  final String? name;
  final int? id;
  final int? height;
  final int? weight;
  final List<PokemonStat>? stats;
  final List<PokemonAbility>? abilities;
  final List<PokemonType>? types;

  PokemonDetail({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.stats,
    required this.abilities,
    required this.types,
  });

  String getFormattedId() {
    return '#${"$id".padLeft(3, '0')}';
  }

  String getImageUrl() {
    return UrlConstants.getPokemonImageUrl(id.toString());
  }

  String getWeight() {
    double cWeight = (weight ?? 10) / 10;
    return '${(cWeight).toStringAsFixed(1)} kg';
  }

  String getHeight() {
    double cHeight = (height ?? 10) / 10;
    return '${(cHeight).toStringAsFixed(1)} m';
  }

  Map<String, int> getStatMap() {
    Map<String, int> mappedStats = {};
    if (stats != null) {
      stats?.forEach((item) {
        var statName = item.stat?.statName ?? "";
        var baseStat = item.baseStat ?? 0;
        mappedStats[statName] = baseStat;
      });
    }
    return mappedStats;
  }

  String getTypeName(String type) {
    switch (type) {
      case "hp":
        return "HP";
      case "attack":
        return "ATK";
      case "defense":
        return "DEF";
      case "special-attack":
        return "SATK";
      case "special-defense":
        return "SDEF";
      case "speed":
        return "SPD";
      default:
        return "";
    }
  }

  String getPokemonType() {
    return types?.first.type?.typeName ?? PokemonTypeConstants.typeGrass;
  }

  String getAbilities() {
    var cAbilities = "";
    abilities?.forEach((item) {
      var value = TextUtils.capitalizeFirst(item.ability?.abilityName ?? "");
      if (item.ability?.abilityName == abilities?.last.ability?.abilityName) {
        cAbilities += value;
      } else {
        cAbilities += "$value\n";
      }
    });
    return cAbilities;
  }
}
