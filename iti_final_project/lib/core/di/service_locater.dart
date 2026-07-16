import 'package:get_it/get_it.dart';
import 'package:iti_final_project/core/network/api_client.dart';
import 'package:iti_final_project/features/home/data/repo/products_repo.dart';
import 'package:iti_final_project/features/home/presentation/cubit/products_cubit.dart';
import 'package:iti_final_project/features/login/data/repos/auth_repository.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));

  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepo(getIt<ApiService>()),
  );

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepo>()),
  );
}
