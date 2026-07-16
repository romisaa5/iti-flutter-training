import 'package:get_it/get_it.dart';
import 'package:iti_final_project/core/network/api_client.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
