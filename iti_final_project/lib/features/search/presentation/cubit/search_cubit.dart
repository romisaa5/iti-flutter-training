import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/features/home/data/repo/products_repo.dart';
import 'package:iti_final_project/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductsRepo productsRepo;

  SearchCubit(this.productsRepo) : super(const SearchIdle());

  Timer? _debounce;

  void onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      emit(const SearchIdle());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      search(query);
    });
  }

  Future<void> search(String query) async {
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      emit(const SearchIdle());
      return;
    }

    emit(SearchLoading(trimmed));

    try {
      final products = await productsRepo.searchProducts(trimmed);

      emit(SearchLoaded(query: trimmed, results: products));
    } catch (e) {
      emit(SearchFailure(query: trimmed, message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
