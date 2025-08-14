import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/onboarding/allergic_model.dart';
import 'package:lesson_1/core/models/onboarding/cuisine_model.dart';
import '../../../core/client.dart';


class CuisineViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  CuisineViewModel() {
    getCuisine();
  }

  List<CuisinesModel> cuisines = [];
  bool isLoading = false;
  String? error;

  Future<void> getCuisine() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/cuisines/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          cuisines = (data as List)
              .map((x) => CuisinesModel.fromJson(x))
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
