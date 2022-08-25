import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_product_state.dart';

class PostProductCubit extends Cubit<PostProductState> {
  PostProductCubit() : super(PostProductInitial());

  
}
