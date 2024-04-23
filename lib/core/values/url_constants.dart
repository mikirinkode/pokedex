class UrlConstants {
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  static String getPokemonImageUrl(String id){
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }
}