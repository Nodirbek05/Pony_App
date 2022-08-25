part of 'fetch_category_data_cubit.dart';

abstract class FetchCategoryDataState {}

class FetchCategoryDataInitial extends FetchCategoryDataState {}


class FetchCategoryDataLoading extends FetchCategoryDataState {}

class FetchCategoryDataError extends FetchCategoryDataState{
  final Failure failure;
  FetchCategoryDataError({required this.failure});
}

class FetchCategoryDataLoaded extends FetchCategoryDataState{
  final List<CategoryData> categoryList;
  FetchCategoryDataLoaded({required this.categoryList});

}
