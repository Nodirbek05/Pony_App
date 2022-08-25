import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ponygold/data/models/failure_model.dart';
import 'package:ponygold/data/models/single_product_model.dart';

part 'adding_product_state.dart';

class AddingProductCubit extends Cubit<AddingProductState> {
  AddingProductCubit() : super(AddingProductInitial());
  int countProduct = 0;

  List<SingleProductData> productData = [];

  void addProduct() {
    countProduct += 1;

    emit(AddingProductInitial());
  }

  void removeProduct() {
    if (countProduct > 0) {
      countProduct -= 1;
    }
    emit(AddingProductInitial());
  }

  
}
