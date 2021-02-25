import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/pokemon.dart';

class PokemonRequest extends ChangeNotifier {
  List<Pokemon> _pokemonDetails = [];

  List<Pokemon> get pokemonDetails {
    return [..._pokemonDetails];
  }

  Pokemon findById(int id) {
    return _pokemonDetails.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchDetails() async {
    List<Pokemon> tempPoke = [];
    final url =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      data['pokemon'].forEach((pokemon) {
        List<String> type = [];
        List<String> weaknesses = [];
        // List<Map<String, String>> next_evolution;
        pokemon['type'].forEach((typePokemon) => type.add(typePokemon));
        pokemon['weaknesses']
            .forEach((weaknessesPokemon) => weaknesses.add(weaknessesPokemon));
        
        // pokemon['next_evolution']!=null?.forEach((key,value) {
          // next_evolution.putIfAbsent(key, key['num']);
          // next_evolution.putIfAbsent(key, key['num']);
          // print(key);
        // });
        tempPoke.add(
          Pokemon(pokemon["id"], pokemon['name'], pokemon['num'],
              pokemon['img'], type, weaknesses),
        );
      });
    } on Exception catch (e) {
      print(e.toString());
    }
    _pokemonDetails = tempPoke;
    notifyListeners();
  }
}
