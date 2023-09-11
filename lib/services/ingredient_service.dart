import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pizza_maker/models/ingredient_model.dart';

class IngredientService {
  static Future<List<IngredientModel>> getIngredients() async {
    final response = await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> ingredientJson = jsonDecode(response);

    List<IngredientModel> ingredients = ingredientJson
        .map((ingredient) => IngredientModel.fromJson(ingredient))
        .toList();

    return ingredients;
  }
}
