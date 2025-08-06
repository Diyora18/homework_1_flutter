
import 'package:flutter/material.dart';

import '../../../core/client.dart';


class RecipeDetailViewModel extends ChangeNotifier {
  bool isLoading = true;
  Map<String, dynamic>? recipeData;
  String? error;

  Future<void> fetchRecipeDetails(int recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final response = await dio.get('/recipes/detail/');

    if (response.statusCode == 200) {
      recipeData = response.data;
    } else {
      error = "Xatolik: ${response.statusCode}";
    }

    isLoading = false;
    notifyListeners();
  }
}
