import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

import '../../data/models/pokemon_detail_model.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonListLoaded extends PokemonState {
  final PagingController<int, PokemonModel> controller;
  final int totalCount;

  PokemonListLoaded(this.controller, this.totalCount);
}

class PokemonDetailLoaded extends PokemonState {
  final PokemonDetailModel pokemon;

  PokemonDetailLoaded(this.pokemon);
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);
}
