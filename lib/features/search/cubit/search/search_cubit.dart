import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {



  final SearchRepo repo;

  SearchCubit(this.repo) : super(SearchInitial());

  Timer? _debounce;

  void search(String query) {

    /// لو المستخدم مسح النص
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    /// إلغاء التايمر القديم
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    /// بدء debounce
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () {
        _searchRecipes(query);
      },
    );
  }

  Future<void> _searchRecipes(String query) async {

    emit(SearchLoading());

    final result = await repo.searchRecipes(query);

    result.fold(
      (error) => emit(SearchError(error)),
      (recipes) => emit(SearchSuccess(recipes)),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
  
}
