part of 'pizza_bloc.dart';

abstract class PizzaEvent {
  const PizzaEvent();
}

class LoadIngredientsEvent extends PizzaEvent {}

class LoadIngredientByCategory extends PizzaEvent {
  final String categoryName;

  LoadIngredientByCategory({required this.categoryName});
}

class AddIngredient extends PizzaEvent {
  final IngredientModel ingredient;

  AddIngredient({required this.ingredient});
}
