import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/home/category_model.dart';

import '../../../core/client.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel() {
    fetchCategories();
  }

  List<CategoryModel> categories = [];
  bool isLoading = false;

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
}
