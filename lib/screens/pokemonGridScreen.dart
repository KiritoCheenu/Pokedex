import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonRequest.dart';
import 'package:pokedex/widgets/pokeCard.dart';
import 'package:pokedex/widgets/pokeGrid.dart';
import 'package:provider/provider.dart';

class PokemonGridScreen extends StatefulWidget {
  @override
  _PokemonGridScreenState createState() => _PokemonGridScreenState();
}

class _PokemonGridScreenState extends State<PokemonGridScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<PokemonRequest>(context).fetchDetails();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Pokemon"),
        ),
        body: PokemonGridView(),
    );
  }
}
