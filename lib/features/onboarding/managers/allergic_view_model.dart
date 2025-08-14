import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/onboarding/allergic_model.dart';
import '../../../core/client.dart';


class AllergicView extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  AllergicView() {
    getAllergic();
  }

  List<AllergicModel> allergic = [];
  bool isLoading = false;
  String? error;

  Future<void> getAllergic() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/allergic/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          allergic = (data as List)
              .map((x) => AllergicModel.fromJson(x))
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
