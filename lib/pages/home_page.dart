import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pokeapp/widgets/Pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller=PageController();
  final List<Widget> _list=<Widget>[
    Center(child:Pages(text: "Bulbasaur", imagen: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png")),
    Center(child:Pages(text: "Charmander", imagen: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png")),
    Center(child:Pages(text: "Squirtle", imagen: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png")),
    Center(child:Pages(text: "Caterpie", imagen: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png"))
  ];
  int _curr=0;
  
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
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              physics: BouncingScrollPhysics(),
              onPageChanged: (num){
                setState(() {
                  _curr=num;
                });
              },
              children: _list,
            ),
          ),
          const Expanded(child: Text('Swiper')),
          Expanded(child: Swiper(
            itemBuilder: (BuildContext context, int index){
              return Image.network("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png",fit: BoxFit.fill,);
            },
            itemCount: 3,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ))
        ],
      ),
    );
  }
}