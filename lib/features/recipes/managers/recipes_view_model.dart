import 'package:flutter/material.dart';

import '../../../core/client.dart';
import '../../../core/models/home/recipe_detail_model.dart';

class RecipeLunchModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  bool isLoading = true;
  DetailModel? recipeData;
  String? error;

  Future<void> fetchRecipeDetails(int recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      '/recipes/detail/$recipeId',
    );

    result.fold(
          (e) {
        error = 'Xatolik: $e';
      },
          (data) {
        try {
          recipeData = DetailModel.fromJson(data);
        } catch (e) {
          error = "Ma'lumotlarni parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
