import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo repository;

  SearchCubit(this.repository) : super(SearchInitial());

  Future<void> searchNews(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchSuccess([]));
      return;
    }

    emit(SearchLoading());

    try {
      final response = await repository.searchNews(query);

      emit(SearchSuccess(response.articles));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void clearList() {
    emit(SearchInitial());
  }
}
