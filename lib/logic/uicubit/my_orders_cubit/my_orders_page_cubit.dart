import 'package:bloc/bloc.dart';

part 'my_orders_page_state.dart';

class MyOrdersPageCubit extends Cubit<MyOrdersPageState> {
  MyOrdersPageCubit() : super(MyOrdersPageInitial());

  int orderPage = 0;
  void changeOrderPage(int order) {
    orderPage = order;
    emit(MyOrdersPageLoaded());
  }
}
