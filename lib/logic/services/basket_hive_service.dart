import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/basket_hive_model/basket_hive_model.dart';

class BasketHiveService {
  late Box<BasketHiveModel> _favoritebox;

  BasketHiveService() {
    _favoritebox = Hive.box<BasketHiveModel>('basketBox');
  }

  void saveFavorite(BasketHiveModel favoriteModel) {
    final box = _favoritebox;
    box.put(favoriteModel.id, favoriteModel);
  }

  List<BasketHiveModel> readFavorites() {
    final box = _favoritebox;
    return box.values.toList();
  }

  void updateFavorite(BasketHiveModel favoriteModel) {
    final box = _favoritebox;
    box.put(favoriteModel.id, favoriteModel);
  }

  void deleteFavorite(int id) {
    final box = _favoritebox;
    box.delete(id);
  }

  void clear() {
    final box = _favoritebox;
    box.clear();
  }
}
