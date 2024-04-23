import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/models/pokemon_response_model.dart';

import '../../core/values/constants.dart';

class PokemonListCubit extends Cubit<PokemonState> {
  PokemonListCubit() : super(PokemonInitial());

  Future<void> getPokemonList() async {
    try {
      emit(PokemonLoading());
      final response = await http.get(Uri.parse(AppConstants.baseUrl));
      if (response.statusCode == 200) {
        var responseModel = PokemonResponseModel.fromJson(jsonDecode(response.body));
        emit(PokemonListLoaded(responseModel.results));
      } else {
        emit(PokemonError('Failed to load Pokemon list'));
      }
    } catch (e) {
      print("error: $e");
      emit(PokemonError(e.toString()));
    }
  }
}