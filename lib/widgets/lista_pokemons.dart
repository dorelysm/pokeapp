import 'package:flutter/material.dart';

import 'package:pokeapp/models/Model_pokemons.dart';

class PokeWidget extends StatelessWidget {
  const PokeWidget({Key? key, required this.poke}) : super(key: key);

  final ModelPokemons poke;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(poke.name),
        Image(
          image: NetworkImage(poke.url),
        )
      ],
    );
  }
}
