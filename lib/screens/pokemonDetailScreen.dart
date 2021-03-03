import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonRequest.dart';
import 'package:pokedex/widgets/pokeDetail.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatefulWidget {
  static const routeName = '/detail';
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final pokeID = ModalRoute.of(context).settings.arguments; // is the id!
    final pokeDetails = Provider.of<PokemonRequest>(
      context,
      listen: false,
    ).findById(pokeID);
    print(pokeDetails.name);
    return Scaffold(
      appBar: AppBar(title: Text(pokeDetails.name)),
      body: PokeDetail(),
    );
  }
}
