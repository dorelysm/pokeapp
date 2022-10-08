import 'package:flutter/material.dart';

import 'package:pokeapp/models/Model_pokemons.dart';
import 'package:pokeapp/widgets/Pages.dart';

Future<List<Widget>> listPokemonsPageView(List<ModelPokemons> data,
    {required ModelPokemons ModelPokemons}) async {
  List<Widget> pokemons = [];
  for (var pokemon in data) {
    pokemons.add(Center(child: Pages(text: pokemon.name, imagen: pokemon.url)));
  }
  return pokemons;
}

List<Widget> lista() {
  List<Widget> pokemons = [];
  for (var i = 0; i <= 10; i++) {
    pokemons.add(Text("dato $i"));
  }

  return pokemons;
}
