import 'package:flutter/material.dart';

import '../../../core/client.dart';
import '../../../core/models/home/category_model.dart';

class RecipesViewModel extends ChangeNotifier {
  RecipesViewModel({required this.categoryId}) {
    fetchRecipes();
    fetchCategories();
  }

  List<dynamic> recipes = [];
  List<CategoryModel> categories = [];
  bool isLoading = false;
  String? error;
  int categoryId;

  Future<void> fetchCategories() async {
    var response = await dio.get("/categories/list");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    } else {
      categories = (response.data as List)
          .map((x) => CategoryModel.fromJson((x)))
          .toList();
    }
    notifyListeners();
  }
  Future<void> fetchRecipes() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final response = await dio.get('/recipes/list?Category=$categoryId');

    if (response.statusCode == 200) {
      recipes = response.data;
    } else {
      error = 'Xatolik: ${response.data}';
    }

    isLoading = false;
    notifyListeners();
  }
}
