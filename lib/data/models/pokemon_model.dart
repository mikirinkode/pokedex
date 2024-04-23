import 'pokemon_ability_model.dart';
import 'pokemon_stat_model.dart';
import 'pokemon_type_model.dart';

class PokemonModel {
  final String name;
  final String? url;

  PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      url: json['url'],
    );
  }

  String getImageUrl() {
    final index = url?.split('/').where((element) => element.isNotEmpty).last;
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$index.png';
  }

  String getPaddedIndex() {
    final index = url?.split('/').where((element) => element.isNotEmpty).last;
    return '#${index?.padLeft(3, '0')}';
  }

  String getName() {
    return name[0].toUpperCase() + name.substring(1);
  }

  int getId() {
    final index = url?.split('/').where((element) => element.isNotEmpty).last ?? "0";
    return int.parse(index);
  }

}