import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_maker/models/ingredient_model.dart';
import '../../services/ingredient_service.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc()
      : super(PizzaState(
            pizza: [],
            ingredients: const [],
            ingredientsByCategory: const [])) {
    on<LoadIngredientsEvent>((event, emit) async {
      List<IngredientModel> ingredients =
          await IngredientService.getIngredients();

      emit(PizzaState(
          pizza: [],
          ingredients: ingredients,
          ingredientsByCategory: const []));
    });

    on<LoadIngredientByCategory>((event, emit) {
      List<IngredientModel> ingredientsByCategory = state.ingredients
          .where((ingredient) => ingredient.category == event.categoryName)
          .toList();

      emit(state.copyWith(ingredientsByCategory: ingredientsByCategory));
    });

    on<AddIngredient>((event, emit) {
      // List<IngredientModel> newPizza = state.pizza;
      List<IngredientModel> newPizza = List.from(state.pizza)
        ..add(event.ingredient);

      emit(state.copyWith(pizza: newPizza));
    });
  }
}
