import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:provider/provider.dart';

class PokeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context,listen: false);
    return Container(
        height: 200,
        width: 200,
        child: GridTile(
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.green,
                child: Image.network(pokemon.img),
              ),
            ),
          ),
          header: GridTileBar(title: Text(pokemon.name)),
        ));
  }
}
