import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/home/category_model.dart';

import '../../../core/client.dart';


class CategoryViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  CategoryViewModel() {
    getCategory();
  }

  List<CategoryModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> getCategory() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/admin/categories/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          categories = (data as List)
              .map((x) => CategoryModel.fromJson(x))
              .toList();
        } catch (e) {
          error = "Ma'lumotlarni parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
