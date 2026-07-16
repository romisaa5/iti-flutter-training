import 'package:iti_final_project/features/login/data/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel response;

  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
