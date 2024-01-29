import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Drink{
  final String drinkName;
  final String imagePath;
  const Drink(this.drinkName, this.imagePath);
}

class DrinkList extends Equatable{
  final List<Drink> drinks;
  final int index;
  const DrinkList(this.drinks, this.index);

  @override
  List<Object?> get props =>[drinks,index];
}