import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/login/data/models/login_request_model.dart';
import 'package:men_store/features/login/data/models/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<UserModel> login(LoginRequestModel request) async {
    final response = await apiService.login(request);

    return UserModel.fromJson(response.data);
  }
}
