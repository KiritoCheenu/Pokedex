import 'package:flutter/material.dart';
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
        child: MaterialApp(
          title: 'Pokemon',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            fontFamily: 'Amazon',
            // textTheme: TextStyle,
          ),
          home: PokemonGridScreen(),
        ));
  }
}
