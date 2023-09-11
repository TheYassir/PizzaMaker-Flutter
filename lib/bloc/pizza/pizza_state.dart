part of 'pizza_bloc.dart';

class PizzaState extends Equatable {
  final List<IngredientModel> pizza;
  final List<IngredientModel> ingredients;
  final List<IngredientModel> ingredientsByCategory;
  final List<String> categories = [
    'pate',
    'base',
    'viande',
    'legume',
    'herbe',
    'fromage',
    'fruit',
    'sauce'
  ];

  PizzaState(
      {required this.pizza,
      required this.ingredients,
      required this.ingredientsByCategory});

  PizzaState copyWith(
      {List<IngredientModel>? pizza,
      List<IngredientModel>? ingredients,
      List<IngredientModel>? ingredientsByCategory}) {
    return PizzaState(
        pizza: pizza ?? this.pizza,
        ingredients: ingredients ?? this.ingredients,
        ingredientsByCategory:
            ingredientsByCategory ?? this.ingredientsByCategory);
  }

  @override
  List<Object?> get props => [pizza, ingredients, ingredientsByCategory];
}
