import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DrinkListEvent extends Equatable{
  const DrinkListEvent([List props = const[]]);
}
class DrinkListScroll extends DrinkListEvent{
  final int index;
  const DrinkListScroll(this.index);

  @override
  List<Object?> get props => [index];
}