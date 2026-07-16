import 'package:iti_final_project/core/network/api_client.dart';
import 'package:iti_final_project/features/login/data/models/login_request_model.dart';
import 'package:iti_final_project/features/login/data/models/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<UserModel> login(LoginRequestModel request) async {
    final response = await apiService.login(request);

    return UserModel.fromJson(response.data);
  }
}
