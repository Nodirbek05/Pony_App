import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_authentication_state.dart';

class PostAuthenticationCubit extends Cubit<PostAuthenticationState> {
  PostAuthenticationCubit() : super(PostAuthenticationInitial());
}
