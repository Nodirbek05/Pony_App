import 'package:bloc/bloc.dart';

part 'caruselchange_state.dart';

class CaruselchangeCubit extends Cubit<CaruselchangeState> {
  CaruselchangeCubit() : super(CaruselchangeInitial());

  List<int> dynamicListIndex = [];

  void getLength(int length) {
    dynamicListIndex = List.generate(length, (index) => 0);
  }

  void imageChange(int productIndex, int photIndex) {
    dynamicListIndex[productIndex] = photIndex;
    print('Favorite Index -------------- $dynamicListIndex');
    emit(CaruselchangeLoaded());
  }

  int homeCarouselIndex = 0;
  changeHomeCarousel(int index) {
    homeCarouselIndex = index;
    emit(CaruselchangeLoaded());
  }

  int detailCarouselIndex = 0;
  changeDetailCarousel(int index) {
    detailCarouselIndex = index;
    emit(CaruselchangeLoaded());
  }

  int pageIndex = 0;
  changePageView(int index) {
    pageIndex = index;
    emit(CaruselchangeLoaded());
  }
}
