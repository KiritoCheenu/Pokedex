import 'package:flutter/material.dart';
import '../model/pokemon.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  PokeCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: GridTile(
        child: GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: Container(
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.fill,
                  ),
                  height: 100,
                ),
              ),
            ),
          ),
        ),
        header: Container(
          height: 25,
          child: GridTileBar(
            backgroundColor: Colors.black12,
            title: Text(pokemon.name),
          ),
        ),
      ),
    );
  }
}
