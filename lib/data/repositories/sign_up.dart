import 'package:lesson_1/core/client.dart';
import 'package:lesson_1/core/models/authentication/sign_up_model.dart';

import '../result.dart';

class SignUpRepository {
  final ApiClient apiClient = ApiClient();

  Future<Result<Map<String, dynamic>>> register(SignUpModel model) async {
    final result = await apiClient.post("/auth/register", data: model.toJson());

    return result.fold((err) => Result.error(err), (data) {
      if (data is Map<String, dynamic>) {
        return Result.ok(data);
      }
      return Result.error(Exception("Xato javob formati"));
    });
  }
}
