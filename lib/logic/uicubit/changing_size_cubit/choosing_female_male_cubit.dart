import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choosing_female_male_state.dart';

class ChoosingFemaleMaleCubit extends Cubit<ChoosingFemaleMaleState> {
  ChoosingFemaleMaleCubit() : super(ChoosingFemaleMaleInitial());

  int selectedSize = 0;

  void changeFemale(int sizeIndex) {
    selectedSize = sizeIndex;
    emit(ChoosingFemaleMaleInitial());
  }
}
