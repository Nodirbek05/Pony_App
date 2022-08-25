import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponygold/data/models/failure_model.dart';
import 'package:ponygold/data/models/single_product_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';

part 'single_product_info_state.dart';

class SingleProductInfoCubit extends Cubit<SingleProductInfoState> {
  SingleProductInfoCubit() : super(SingleProductInfoInitial());
  final Repository apiRepository = ShopRepository(ShopApi());

  Future<void> fetchSingleProductInfo(BuildContext context) async {
    emit(SingleProductInfoLoading());
    try {
      final List<SingleProductData> singleProList =
          await apiRepository.getSingleProduct();
      BlocProvider.of<CaruselchangeCubit>(context)
          .getLength(singleProList.length);
      emit(SingleProductInfoLoaded(productModel: singleProList));
    } on Failure catch (failure) {
      emit(SingleProductInfoError(failure: failure));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
