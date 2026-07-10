import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/cubit/home_state.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getNews() async {
    emit(HomeLoading());

    try {
      final news = await repo.getNews();

      emit(HomeSuccess(news));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
