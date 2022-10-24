class Pokemons {
  List<ModelPokemons> items = [];

  Pokemons();
  Pokemons.fromJsonList(jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList['results']) {
      final pokemon = new ModelPokemons.fromJsonMap(item);
      items.add(pokemon);
    }
  }
}

class ModelPokemons {
  late String name;
  late String url;

  ModelPokemons(this.name, this.url);

  ModelPokemons.fromJsonMap(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
