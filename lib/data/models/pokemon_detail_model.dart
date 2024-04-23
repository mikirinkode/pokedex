import 'package:pokedex/core/utils/text_utils.dart';
import 'package:pokedex/core/values/pokemon_type_constants.dart';
import 'package:pokedex/core/values/url_constants.dart';

import 'pokemon_ability_model.dart';
import 'pokemon_stat_model.dart';
import 'pokemon_type_model.dart';

class PokemonDetailModel {
  final String name;
  final int? id;
  final int? height;
  final int? weight;
  final List<PokemonStatModel>? stats;
  final List<PokemonAbilityModel>? abilities;
  final List<PokemonTypeModel>? types;

  PokemonDetailModel({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.stats,
    required this.abilities,
    required this.types,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      name: json['name'],
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      stats: List<PokemonStatModel>.from(
          json['stats'].map((model) => PokemonStatModel.fromJson(model))),
      types: List<PokemonTypeModel>.from(
          json['types'].map((model) => PokemonTypeModel.fromJson(model))),
      abilities: List<PokemonAbilityModel>.from(json['abilities']
          .map((model) => PokemonAbilityModel.fromJson(model))),
    );
  }

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
        mappedStats[item.stat.statName] = item.baseStat;
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
    return types?.first.type.typeName ?? PokemonType.typeGrass;
  }

  String getAbilities() {
    var cAbilities = "";
    abilities?.forEach((item) {
      var value = TextUtils.capitalizeFirst(item.ability.abilityName);
      if (item.ability.abilityName == abilities?.last.ability.abilityName) {
        cAbilities += value;
      } else {
        cAbilities += "$value\n";
      }
    });
    return cAbilities;
  }
}
