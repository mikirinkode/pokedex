import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex/data/models/pokemon_response_model.dart';

import '../../core/values/url_constants.dart';
import '../../data/models/pokemon_model.dart';

class PokemonListCubit extends Cubit<PokemonState> {
  final _pageSize = 100;
  final PagingController<int, PokemonModel> pagingController =
  PagingController(firstPageKey: 0);

  PokemonListCubit() : super(PokemonInitial()) {
      emit(PokemonLoading());
    pagingController.addPageRequestListener((pageKey) {
      getPokemonList(pageKey);
    });
  }

  Future<void> getPokemonList(int pageKey) async {
    var uri = "${UrlConstants.baseUrl}?offset=$pageKey&limit=$_pageSize";
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responseModel = PokemonResponseModel.fromJson(jsonDecode(response.body));
        final isLastPage = responseModel.next == null;
        if (isLastPage) {
          pagingController.appendLastPage(responseModel.results);
        } else {
          final nextPageKey = pageKey + responseModel.results.length;

          pagingController.appendPage(responseModel.results, nextPageKey);
        }
        emit(PokemonListLoaded(pagingController, responseModel.count));
      } else {
        emit(PokemonError('Failed to load Pokemon list'));
      }
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
