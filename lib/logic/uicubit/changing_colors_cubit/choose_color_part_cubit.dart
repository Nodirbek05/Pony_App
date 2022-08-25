import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choose_color_part_state.dart';

class ChooseColorPartCubit extends Cubit<ChooseColorPartState> {
  ChooseColorPartCubit() : super(ChooseColorPartInitial());

  String numberOfColor = '';

  void changeColor(String colorIndex) {
    numberOfColor = colorIndex;
    emit(ChooseColorPartInitial());
  }
}
