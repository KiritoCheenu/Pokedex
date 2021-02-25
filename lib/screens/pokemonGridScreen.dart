import 'package:flutter/material.dart';
import 'package:pokedex/providers/PokemonRequest.dart';
import 'package:pokedex/widgets/pokeGrid.dart';
import 'package:provider/provider.dart';

class PokemonGridScreen extends StatefulWidget {
  @override
  _PokemonGridScreenState createState() => _PokemonGridScreenState();
}

class _PokemonGridScreenState extends State<PokemonGridScreen> {
  var _isInit = true;
  var _isLoading = false;
  
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PokemonRequest>(context).fetchDetails().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POKEMON"),
      ),
      backgroundColor: Color(0xfffcf0f7),
      body: _isLoading?Center(child:CircularProgressIndicator()): PokemonGridView(),
    );
  }
}
