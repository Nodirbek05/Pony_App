import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:ponygold/data/models/my_order_model.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';

part 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit() : super(MyOrderInitial());

  final Repository apiRepository = ShopRepository(ShopApi());
  final Box userId = Hive.box<int>('userId');

  Future<void> fetchMyOrder() async {
    emit(MyOrderLoading());
    try {
      final List<Order> activeOrder = [];
      final List<Order> finishedOrder = [];

      final List<Order> myOrder =
          await apiRepository.getMyOrder(userId.values.first.toString());
      for (var order in myOrder) {
        if (order.status == 'pending') {
          activeOrder.add(order);
        } else {
          finishedOrder.add(order);
        }
      }
      emit(MyOrderLoaded(
          activeOrder: activeOrder, finishedOrder: finishedOrder));
    } catch (e) {
      print(e.toString());
      emit(MyOrderFailure(e.toString()));
    }
  }
}
