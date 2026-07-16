import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/network/token_storage.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    checkAuth();
  }

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await TokenStorage.isLoggedIn();
    if (isLoggedIn) {
      emit(SplashLoggedIn());
    } else {
      emit(SplashLoggedOut());
    }
  }
}
