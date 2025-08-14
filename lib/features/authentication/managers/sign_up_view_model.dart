

import 'package:flutter/cupertino.dart';
import 'package:lesson_1/core/models/authentication/sign_up_model.dart';
import 'package:lesson_1/data/repositories/sign_up.dart';

class SignUpViewModel extends ChangeNotifier{
  final SignUpRepository repository = SignUpRepository();

  bool isLoading= false;
  String? error;
  bool success= false;

  Future<void> register(SignUpModel model) async{
    isLoading=true;
    success=false;
    notifyListeners();

    final result= await repository.register(model);

    result.fold(
        (err)=> error=err.toString(),
        (data)=> success=true,
    );
  }
}