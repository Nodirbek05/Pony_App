import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changing_and_choosing_size_state.dart';

class ChangingAndChoosingSizeCubit extends Cubit<ChangingAndChoosingSizeState> {
  ChangingAndChoosingSizeCubit() : super(ChangingAndChoosingSizeInitial());

  String selectedSize = '';

  void changeSize(String sizeIndex) {
    selectedSize = sizeIndex;
    emit(ChangingAndChoosingSizeInitial());
  }
}
