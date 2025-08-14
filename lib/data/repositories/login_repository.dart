import 'package:lesson_1/core/client.dart';
import 'package:lesson_1/core/models/authentication/login_model.dart';

import '../result.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    final result = await apiClient.post("auth/login", data: model.toJson());

    return result.fold(
            (err)=> Result.error(err),
            (data){
          if(data is Map<String, dynamic>){
            if(data["accesstoken"]!= null && data["accessToken"].toString().isNotEmpty){
              return Result.ok(data);
            }else{
              return Result.error(Exception("Token kelmadi"));
            }
          }
          return Result.error(Exception("Xato"));
        }
    );
  }

}
