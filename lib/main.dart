import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/screens/pokemonGridScreen.dart';

import 'package:provider/provider.dart';
import 'providers/PokemonRequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: PokemonRequest(),
          ),

        ],
        child: Consumer<Pokemon>(
          builder:(ctx,poke,_)=> MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          home: PokemonGridScreen(),
        )));
  }
}

