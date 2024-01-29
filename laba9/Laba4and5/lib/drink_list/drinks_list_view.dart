import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba4and5/drink_list/drink_list_bloc.dart';
import 'package:laba4and5/drink_list/drink_list_event.dart';
import 'package:laba4and5/drink_list/drink_list_state.dart';

class DrinksListView extends StatelessWidget {
  const DrinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkListBloc, DrinkListScrolled>(
      builder: (context,DrinkListScrolled state) {
        PageController pageController = PageController(initialPage: state.list.index);
        return Container(
            height: 550,
            child:Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.list.drinks.map((e) => TextButton(
                  onPressed: () {int i = state.list.drinks.indexOf(e); context.read<DrinkListBloc>().add(DrinkListScroll(i)); pageController.jumpToPage(i); },
                  child: Text(e.drinkName,
                    style: state.list.drinks.indexOf(e) == state.list.index?
                    const TextStyle(
                        fontSize: 26,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange) :
                    const TextStyle(
                        fontSize: 24,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent
                    ),
                  ),
                )).toList(),
              ),
            ),
            Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, top:5, bottom: 5),
            child:PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (page){
                context.read<DrinkListBloc>().add(DrinkListScroll(page));
              },
              children: state.list.drinks.map((n)=>
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 300,
                    height: 450,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(n.imagePath),
                      ),
                    ),
                  )
              ).toList(),
            ),
          ),)
        ]));
      },
    );
  }
}