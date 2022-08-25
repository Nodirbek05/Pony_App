import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';
import '../../../data/models/basket_hive_model/basket_hive_model.dart';
import '../../services/basket_hive_service.dart';

part 'order_product_state.dart';

class OrderProductCubit extends Cubit<OrderProductState> {
  OrderProductCubit() : super(OrderProductInitial());

  final BasketHiveService _service = BasketHiveService();

  final Repository apiRepository = ShopRepository(ShopApi());
  final Box userId = Hive.box<int>('userId');

  Future<void> fetchOrder(String orderType, String sum, String cashType,
      List<BasketHiveModel> basket) async {
    emit(OrderProductLoading());
    try {
      List<Map<String, dynamic>> items = List.generate(
          basket.length,
          (index) => {
                "product_id": basket[index].id,
                "qty": basket[index].count,
              });
      await Future.delayed(const Duration(seconds: 1));
      await apiRepository.postOrder(
          userId.values.first.toString(), orderType, sum, cashType, items);
      _service.clear();

      emit(OrderProductLoaded());
    } catch (e) {
      print('Errorrr --------- $e');
      emit(OrderProductFailure(e.toString()));
    }
  }
}
