
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba4and5/drink_list/drink.dart';
import 'package:laba4and5/drink_list/drink_list_event.dart';
import 'package:laba4and5/drink_list/drink_list_state.dart';

class DrinkListBloc extends Bloc<DrinkListEvent, DrinkListScrolled>{
  final List<Drink> drinks;
  DrinkListBloc(this.drinks) : super(DrinkListScrolled(DrinkList(drinks,0))){
    on((DrinkListEvent event, emit) => emit(mapEventToState(event)));
  }

  DrinkListScrolled mapEventToState(DrinkListEvent event) {
    if(event is DrinkListScroll){
      final list =  DrinkList(drinks, event.index);
      return DrinkListScrolled(list);
    }
    return DrinkListScrolled(DrinkList(drinks, 0));
  }
}