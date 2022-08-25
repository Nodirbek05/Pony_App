import 'package:bloc/bloc.dart';
import 'package:ponygold/data/models/brand_model.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';
import '../../../data/models/failure_model.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  final Repository apiRepository = ShopRepository(ShopApi());

  Future<void> fetchBrands() async {
    emit(BrandLoading());
    try {
      final List<BrandData> brands = await apiRepository.getBrands();
      emit(BrandLoaded(brands));
    } on Failure catch (failure) {
      emit(BrandFailure(failure));
    } catch (e) {
      print(e.toString());
    }
  }
}
