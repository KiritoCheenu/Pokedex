import 'package:flutter/material.dart';
import '../providers/PokemonRequest.dart';
import './pokeCard.dart';
import 'package:provider/provider.dart';

class PokemonGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonData = Provider.of<PokemonRequest>(context);
    final pokemonList = pokemonData.pokemonDetails;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: pokemonList.length,
      itemBuilder: (ctx, i) => PokeCard(pokemonList[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
