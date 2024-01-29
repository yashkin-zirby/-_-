import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:laba4and5/drink_list/drink.dart';

@immutable
abstract class DrinkListState extends Equatable{
  const DrinkListState([List props = const[]]);
}

class DrinkListScrolled extends DrinkListState{
  final DrinkList list;
  const DrinkListScrolled(this.list);

  @override
  List<Object?> get props => [list];
}