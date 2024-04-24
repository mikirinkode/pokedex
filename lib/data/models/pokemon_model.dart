import 'package:pokedex/core/values/url_constants.dart';

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
    final index = url?.split('/').where((element) => element.isNotEmpty).last ?? "0";
    return UrlConstants.getPokemonImageUrl(index);
  }

  String getPaddedIndex() {
    final index = url?.split('/').where((element) => element.isNotEmpty).last;
    return '#${index?.padLeft(3, '0')}';
  }

  int getId() {
    final index = url?.split('/').where((element) => element.isNotEmpty).last ?? "0";
    return int.parse(index);
  }

}