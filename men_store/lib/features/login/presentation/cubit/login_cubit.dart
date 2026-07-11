import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:men_store/features/login/data/models/login_request_model.dart';
import 'package:men_store/features/login/data/repos/auth_repository.dart';
import 'package:men_store/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await repository.login(
        LoginRequestModel(email: username, password: password),
      );

      emit(LoginSuccess(response));
    } on DioException catch (e) {
      emit(LoginError(e.response?.data["message"] ?? "Something went wrong"));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
