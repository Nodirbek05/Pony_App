import 'package:bloc/bloc.dart';
import 'package:ponygold/data/models/search_model.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchData? matchQuery;

  final Repository apiRepository = ShopRepository(ShopApi());

  Future<void> fetchSearch(String query) async {
    emit(SearchLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      SearchData searchResult =
          await apiRepository.getSearch(query.trim());
      matchQuery = searchResult;
      print('MatchQuery ------------- ::::::::::::: $matchQuery');
      emit(SearchLoaded(searchResult));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  // void forClear() {
  //   matchQuery.clear();
  //   emit(SearchInitial());
  // }

  // void deleteByIndex(int index) {
  //   matchQuery.removeAt(index);
  //   emit(SearchInitial());
  // }
}
