import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:ponygold/logic/services/basket_hive_service.dart';

import '../../../data/models/basket_hive_model/basket_hive_model.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  int _sumOfProduct = 0;

  int get sumOfProduct => _sumOfProduct;

  final BasketHiveService _service = BasketHiveService();

  List<BasketHiveModel> _databaseBaskets = [];

  List<BasketHiveModel> get databaseBaskets => _databaseBaskets;

  void saveBasketCubit(BasketHiveModel favoriteHiveModel) async {
    final imageFile = await convertByte(favoriteHiveModel.imageUrl);
    favoriteHiveModel.imageFile = imageFile;
    _service.saveFavorite(favoriteHiveModel);
    getBasketCubit();
  }

  void updateFavoriteCubit(BasketHiveModel favoriteHiveModel) {
    _service.updateFavorite(favoriteHiveModel);
    getBasketCubit();
  }

  void deleteFavoriteCubit(int id) {
    _service.deleteFavorite(id);
    getBasketCubit();
  }

  void getBasketCubit() {
    _sumOfProduct = 0;
    _databaseBaskets = _service.readFavorites();
    for (var basketProduct in databaseBaskets) {
      _sumOfProduct += basketProduct.count * int.parse(basketProduct.price);
    }
    print('Saqlandi ::::::::::::::: $databaseBaskets');
    emit(DatabaseInitial());
  }

  Future<Uint8List> convertByte(String imageUrl) async {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
            .buffer
            .asUint8List();
    return bytes;
  }
}
