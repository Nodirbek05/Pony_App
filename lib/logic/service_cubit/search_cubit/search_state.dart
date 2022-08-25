part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchData searchResult;
  SearchLoaded(this.searchResult);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
