import 'package:pokedex/utils/url_constants.dart';

class Pokemon {
  final String? name;
  final String? url;

  Pokemon({
    required this.name,
    required this.url,
  });

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