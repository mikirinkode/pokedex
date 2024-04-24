import 'package:http/http.dart' as http;
import 'package:pokedex/data/dto/pokemon_detail_dto.dart';
import 'package:pokedex/data/dto/pokemon_pagination_dto.dart';

import '../../domain/entity/pokemon_detail.dart';
import '../../domain/entity/pokemon_pagination.dart';
import '../../utils/url_constants.dart';

abstract class Api {
  Future<PokemonPagination?> getPokemonList(
      {int pageKey = 0, int pageSize = 8});

  Future<PokemonDetail> getPokemonDetail({int pokemonId = 0});
}

class ApiImpl implements Api {
  @override
  Future<PokemonPagination?> getPokemonList(
      {int pageKey = 0, int pageSize = 8}) async {
    var uri = "${UrlConstants.baseUrl}?offset=$pageKey&limit=$pageSize";

    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responseModel = PokemonPaginationDto.fromRawJson(response.body);
        return responseModel;
      } else {
        return Future.error("Failed to load pokemon list");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<PokemonDetail> getPokemonDetail({int pokemonId = 0}) async {
    try {
      final response = await http.get(Uri.parse('${UrlConstants.baseUrl}/$pokemonId'));
      if (response.statusCode == 200) {
        var responseModel = PokemonDetailDto.fromRawJson(response.body);
        return responseModel;
      } else {
        return Future.error("Failed to load pokemon list");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
