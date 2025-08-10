import 'package:flutter/cupertino.dart';

import '../../../core/client.dart';
import '../../../core/models/onboarding/onboardingmodel.dart';

class OnBoardingViewModel extends ChangeNotifier {
  OnBoardingViewModel(int id) {
    getImage(id);
  }

  OnBoardingModel? images;
  bool isLoading = false;
  Future<void> getImage(int id) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dio.get("/onboarding/list");
      final list = (response.data as List)
          .map((x) => OnBoardingModel.fromJson(x))
          .toList();
      images = list.firstWhere((item) => item.id == id);
    } catch(x){
      print("Error: $x");
    }
    isLoading=false;
    notifyListeners();
  }

}