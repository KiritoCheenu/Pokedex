import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'pokemon.dart';

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
        "http://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      data['pokemon'].forEach((pokemon) {
        tempPoke.add(Pokemon(
            pokemon["id"], pokemon['num'], pokemon['name'], pokemon['img']));
      });
    } on Exception catch (e) {
      print(e.toString());
    }
    _pokemonDetails = tempPoke;
    notifyListeners();
  }
}
