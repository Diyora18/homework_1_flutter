import 'package:flutter/material.dart';
import 'package:lesson_1/core/models/onboarding/cuisine_model.dart';

import '../../../core/client.dart';

class CuisineViewModel extends ChangeNotifier{
  CuisineViewModel(){
    fetchCuisines();
  }

  List<CuisinesModel> cuisines=[];
  bool isLoading = false;

  Future<void> fetchCuisines() async {
    var response = await dio.get("/cuisines/list");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    } else {
      cuisines = (response.data as List)
          .map((x) => CuisinesModel.fromJson((x)))
          .toList();
    }
    notifyListeners();
  }
}