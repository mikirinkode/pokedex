import 'package:flutter/material.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

import '../../data/models/pokemon_detail_model.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonListLoaded extends PokemonState {
  final List<PokemonModel> pokemonList;

  PokemonListLoaded(this.pokemonList);
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);
}
