import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entity/pokemon.dart';
import '../../domain/entity/pokemon_detail.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonListLoaded extends PokemonState {
  final PagingController<int, Pokemon> controller;
  final int totalCount;

  PokemonListLoaded(this.controller, this.totalCount);
}

class PokemonDetailLoaded extends PokemonState {
  final PokemonDetail pokemon;

  PokemonDetailLoaded(this.pokemon);
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);
}
