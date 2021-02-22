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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0x995F0A87), Color(0x4dA4508B)])),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.fill,
                  ),
                  height: 150,
                ),
              ),
            ),
          ),
        ),
        footer: Container(
          height: 40,
          child: GridTileBar(
            title: Text(
              pokemon.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Hoedown',),
            ),
          ),
        ),
      ),
    );
  }
}
