import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/home/recipe_detail_model.dart';
import 'package:lesson_1/core/models/home/recipe_model.dart';

import '../../../core/client.dart';


class RecipeDetailViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();
  List<DetailModel> recipes = [];
  bool isLoading = false;
  String? error;


  Future<void> fetchRecipeDetails(num recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "recipes/list", queryParams: {"Category": recipeId},
    );

    result.fold(
          (e) {
        error = 'Xatolik: $e';
      },
          (data) {
        try {
          recipes = (data as List)
              .map((x) => DetailModel.fromJson(x))
              .toList();
        } catch (e) {
          error = "Malumotlarni pars qilishda xato: $e";
        }
      },

    );
    isLoading = false;
    notifyListeners();
  }
}
