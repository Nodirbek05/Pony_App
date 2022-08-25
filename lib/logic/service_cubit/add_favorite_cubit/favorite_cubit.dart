import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ponygold/data/models/failure_model.dart';
import 'package:ponygold/data/models/favorite_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final Repository apiRepository = ShopRepository(ShopApi());

  final Box _favoriteBox = Hive.box<int>('favorites');

  Future<void> fetchFavorites(BuildContext context) async {
    emit(FavoriteLoading());
    try {
      final List<FavoriteProduct> favorites =
          await apiRepository.getFavorites(_favoriteBox.values.toList());

      BlocProvider.of<CaruselchangeCubit>(context).getLength(favorites.length);
      emit(FavoriteLoaded(favorites));
    } on Failure catch (failure) {
      emit(FavoriteFailure(failure));
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteFromFavorite(List<FavoriteProduct> productList, int index) {
    _favoriteBox.delete(productList[index].id);
    productList.remove(productList[index]);
    emit(FavoriteLoaded(productList));
  }
}
