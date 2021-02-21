import 'package:flutter/material.dart';

class Pokemon extends ChangeNotifier{
  final int id;
  final String name;
  final String num;
  final String img;

  Pokemon(this.id, this.name, this.num, this.img);
}