import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/onboarding/cuisine_model.dart';

import '../../../core/client.dart';
import '../../../core/models/onboarding/allergic_model.dart' show AllergicModel;

class AllergicViewModel extends ChangeNotifier {
  AllergicViewModel() {
    fetchAllergic();
  }

  List<AllergicModel> allergic = [];
  bool isLoading = false;

  Future<void> fetchAllergic() async {
    var response = await dio.get("/allergic/list");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    } else {
      allergic = (response.data as List)
          .map((x) => AllergicModel.fromJson((x)))
          .toList();
    }
    notifyListeners();
  }
}
