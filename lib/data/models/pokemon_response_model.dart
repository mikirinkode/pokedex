import 'pokemon_model.dart';

class PokemonResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  PokemonResponseModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<PokemonModel>.from(
          json['results'].map((model) => PokemonModel.fromJson(model))),
    );
  }
}
