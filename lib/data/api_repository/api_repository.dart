import 'dart:convert';
import 'package:http/http.dart';
import 'package:ponygold/data/api_service/api_service.dart';
import 'package:ponygold/data/models/banner_model.dart';
import 'package:ponygold/data/models/brand_model.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/data/models/favorite_model.dart';
import 'package:ponygold/data/models/my_order_model.dart';
import 'package:ponygold/data/models/search_model.dart';

import '../models/single_product_model.dart';

abstract class Repository {
  ShopApi shopApi;

  Repository({required this.shopApi}) {
    shopApi = ShopApi();
  }

  Future<List<CategoryData>> getCategories();

  Future<Map<String, dynamic>> getAddFavorite(String productId);

  Future<Map<String, dynamic>> getAuth(String number);

  Future<Map<String, dynamic>> getSmsCode(String code, String userId);

  Future<Map<String, dynamic>> getUserDelete(int userId);

  Future<List<SingleProductData>> getSingleProduct();

  Future<List<BannerDatum>> getBanners();

  Future<List<FavoriteProduct>> getFavorites(List<dynamic> idList);

  Future<SearchData> getSearch(String query);

  Future<List<BrandData>> getBrands();

  Future<Map<String, dynamic>> postOrder(String userId, String orderType,
      String sum, String cashType, List<Map<String, dynamic>> items);

  Future<List<Order>> getMyOrder(String userId);
}

class ShopRepository extends Repository {
  ShopRepository(ShopApi api) : super(shopApi: api);

  @override
  Future<List<CategoryData>> getCategories() async {
    Response rawResponse = await shopApi.getRawCategories();

    Map<String, dynamic> shopDecode = jsonDecode(rawResponse.body);
    List<CategoryData> categories = (shopDecode['data'] as List)
        .map((e) => CategoryData.fromJson(e))
        .toList();

    return categories;
  }

  @override
  Future<Map<String, dynamic>> getAddFavorite(String productId) async {
    Response rawResponse = await shopApi.getRawAddFavorite(productId);

    Map<String, dynamic> shopDecode = jsonDecode(rawResponse.body);

    return shopDecode;
  }

  @override
  Future<List<SingleProductData>> getSingleProduct() async {
    Response rawResponse = await shopApi.getRawSingleProduct();

    Map<String, dynamic> shopDecode = jsonDecode(rawResponse.body);
    List<SingleProductData> singleProduct = (shopDecode['data'] as List)
        .map((e) => SingleProductData.fromJson(e))
        .toList();
    return singleProduct;
  }

  @override
  Future<Map<String, dynamic>> getAuth(String number) async {
    Response rawResponse = await shopApi.getRawAuth(number);

    Map<String, dynamic> authInfo = jsonDecode(rawResponse.body);

    return authInfo;
  }

  @override
  Future<Map<String, dynamic>> getSmsCode(String code, String userId) async {
    Response rawResponse = await shopApi.getRawSmsCode(code, userId);

    Map<String, dynamic> smsCode = jsonDecode(rawResponse.body);

    return smsCode;
  }

  @override
  Future<Map<String, dynamic>> getUserDelete(int userId) async {
    Response rawResponse = await shopApi.getRawUserDelete(userId);

    Map<String, dynamic> userDeleteInfo = jsonDecode(rawResponse.body);

    return userDeleteInfo;
  }

  @override
  Future<List<BannerDatum>> getBanners() async {
    Response bannerResponse = await shopApi.getBannersApi();

    Map<String, dynamic> bannerDecode = jsonDecode(bannerResponse.body);
    List<BannerDatum> bannerInfo = (bannerDecode['data']['data'] as List)
        .map((e) => BannerDatum.fromJson(e))
        .toList();

    return bannerInfo;
  }

  @override
  Future<List<FavoriteProduct>> getFavorites(List<dynamic> idList) async {
    Response favoriteResponse = await shopApi.getRawFavorites(idList);

    Map<String, dynamic> favoriteDecode = jsonDecode(favoriteResponse.body);
    if (favoriteDecode['status'] == false) {
      return [];
    }
    List<FavoriteProduct> favoriteInfo = (favoriteDecode['products'] as List)
        .map((e) => FavoriteProduct.fromJson(e))
        .toList();

    return favoriteInfo;
  }

  @override
  Future<SearchData> getSearch(String query) async {
    Response rawResponse = await shopApi.getRawSearch(query);

    Map<String, dynamic> searchDecode = json.decode(rawResponse.body);
    // print('SearchDecoded ------------------ $searchDecode');

    List<SearchModel> searchModel = [searchDecode]
        .map(
          (e) => SearchModel.fromJson(e),
        )
        .toList();
    print('Search datata ------------------------ $searchModel');

    return searchModel[0].data!;
  }

  @override
  Future<List<BrandData>> getBrands() async {
    Response rawResponse = await shopApi.getRawBrand();

    Map<String, dynamic> brandDecode = jsonDecode(rawResponse.body);
    List<BrandData> brands = (brandDecode['data']['data'] as List)
        .map((e) => BrandData.fromJson(e))
        .toList();

    return brands;
  }

  @override
  Future<Map<String, dynamic>> postOrder(String userId, String orderType,
      String sum, String cashType, List<Map<String, dynamic>> items) async {
    Response rawResponse =
        await shopApi.postRawOrder(userId, orderType, sum, cashType, items);
    Map<String, dynamic> orderDecode = jsonDecode(rawResponse.body);

    return orderDecode;
  }

  @override
  Future<List<Order>> getMyOrder(String userId) async {
    Response rawResponse = await shopApi.getRawMyOrder(userId);

    Map<String, dynamic> orderDecode = json.decode(rawResponse.body);

    List<Order> myOrderModel =
        (orderDecode['data']['orders'] as List).map((e) => Order.fromJson(e)).toList();

    return myOrderModel;
  }
}
