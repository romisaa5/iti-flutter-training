import 'package:get_it/get_it.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/cart/data/repos/cart_repo.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:men_store/features/home/data/repo/products_repo.dart';
import 'package:men_store/features/home/presentation/cubit/products_cubit.dart';
import 'package:men_store/features/login/data/repos/auth_repository.dart';
import 'package:men_store/features/login/presentation/cubit/login_cubit.dart';

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

  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt<ApiService>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));
}
