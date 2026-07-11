import 'package:get_it/get_it.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/login/data/repos/auth_repository.dart';
import 'package:men_store/features/login/presentation/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));
}
