
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba4and5/drink_list/drink.dart';
import 'package:laba4and5/drink_list/drink_list_bloc.dart';
import 'package:laba4and5/drink_list/drinks_list_view.dart';

class DrinksPageList extends StatelessWidget{
  final List<Drink> _drinks;
  const DrinksPageList(this._drinks, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>DrinkListBloc(_drinks),
        child: const DrinksListView(),
    );
  }

}