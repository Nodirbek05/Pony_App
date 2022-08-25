import 'package:bloc/bloc.dart';
import 'package:ponygold/data/api_repository/api_repository.dart';
import 'package:ponygold/data/api_service/api_service.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/data/models/failure_model.dart';

part 'fetch_category_data_state.dart';

class FetchCategoryDataCubit extends Cubit<FetchCategoryDataState> {
  FetchCategoryDataCubit() : super(FetchCategoryDataInitial());
  final Repository apiRepository = ShopRepository(ShopApi());

  Future<void> fetchCategoryData() async {
    emit(FetchCategoryDataLoading());
    try {
      final List<CategoryData> categoryList1 =
          await apiRepository.getCategories();
      emit(FetchCategoryDataLoaded(categoryList: categoryList1));
    } on Failure catch (failure) {
      emit(FetchCategoryDataError(failure: failure));
    } catch (e) {
      print(e.toString());
    }
  }
}
