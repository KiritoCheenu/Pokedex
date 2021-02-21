import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonRequest.dart';
import 'package:pokedex/widgets/pokeCard.dart';
import 'package:provider/provider.dart';

class PokemonGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonData = Provider.of<PokemonRequest>(context);
    final pokemonList = pokemonData.pokemonDetails;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: pokemonList.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: pokemonList[i],
        child: PokeCard(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
