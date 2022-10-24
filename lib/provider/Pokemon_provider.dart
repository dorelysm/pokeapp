import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokeapp/models/Model_pokemons.dart';

class PokemonProvider {
  final url = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0";
  final List pokemonList = [];

  Future<List<ModelPokemons>> getPokemons() async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var pokemon in jsonData['results']) {
        var item = await getPokemon(pokemon['url']);
        pokemonList.add(item);
      }

      final pokemons = Pokemons.fromJsonList(jsonData);
      return pokemons.items;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future getPokemon(String url) async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      return jsonData;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }
}
