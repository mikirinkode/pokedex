import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex/core/values/constants.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

import '../../data/models/pokemon_detail_model.dart';

class PokemonDetailCubit extends Cubit<PokemonState> {
  PokemonDetailCubit() : super(PokemonInitial());

  Future<void> getPokemonDetail(int id) async {
    print("getPokemonDetail Called. id: $id");
    try {
      emit(PokemonLoading());
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/$id'));
      if (response.statusCode == 200) {
        emit(PokemonDetailLoaded(PokemonDetailModel.fromJson(jsonDecode(response.body))));
      } else {
        emit(PokemonError('Failed to load Pokemon detail'));
      }
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
