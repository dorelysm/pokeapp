import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pokeapp/models/Model_pokemons.dart';
import 'package:pokeapp/provider/Pokemon_provider.dart';

import 'package:pokeapp/widgets/lista_pokemons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<ModelPokemons>> _listadoPokemons;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    final getProvider = PokemonProvider();
    _listadoPokemons = getProvider.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('POKEMON'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<ModelPokemons>>(
                  future: _listadoPokemons,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PokeWidget(poke: snapshot.data![index]);
                          });
                    } else {
                      print(snapshot.error);
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Expanded(
                child: FutureBuilder<List<ModelPokemons>>(
              future: _listadoPokemons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Swiper(
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                    itemBuilder: (context, index) {
                      return PokeWidget(poke: snapshot.data![index]);
                    },
                  );
                } else {
                  print(snapshot.error);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ));
  }
}
