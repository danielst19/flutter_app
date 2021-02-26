import 'dart:convert';
import 'package:http/http.dart' as http;

class _PokemonService {
  int _itemsPerPage = 10;

  Future<Map> getPokemons(int page) async {
    int _offset = page * _itemsPerPage;
    String url = 'https://pokeapi.co/api/v2/pokemon?offset=$_offset&limit=$_itemsPerPage';
    final response = await http.get(url);
    Map<String, dynamic> mapResponse = json.decode(response.body);
    return mapResponse;
  }

  Future<Map> getPokemonDetail(String url) async{
    final response = await http.get(url);
    Map<String, dynamic> mapResponse = json.decode(response.body);
    return mapResponse;
  }

}

final pokemonService = _PokemonService();