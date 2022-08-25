import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ponygold/core/constant/basic_url.dart';

class ShopApi {
  Future<http.Response> getRawAuth(String number) async {
    Map<String, dynamic> map = {"number": number};
    http.Response rawAuth =
        await http.post(Uri.parse("${BasicUrl.basicUrl}/get/code"), body: map);

    debugPrint(rawAuth.body.toString());

    return rawAuth;
  }

  Future<http.Response> getRawUserDelete(int userId) async {
    http.Response rawUserDelete = await http
        .post(Uri.parse("${BasicUrl.basicUrl}/delete/user?user_id=$userId"));

    debugPrint(rawUserDelete.body.toString());

    return rawUserDelete;
  }

  Future<http.Response> getRawSmsCode(String code, String userId) async {
    Map<String, dynamic> map = {"code": code, "user_id": userId};
    http.Response rawSmsCode = await http
        .post(Uri.parse("${BasicUrl.basicUrl}/get/token/user"), body: map);

    debugPrint(rawSmsCode.body.toString());

    return rawSmsCode;
  }

  Future<http.Response> getRawCategories() async {
    http.Response rawCategories =
        await http.get(Uri.parse("${BasicUrl.basicUrl}/category"));

    debugPrint(rawCategories.body.toString());

    return rawCategories;
  }

  Future<http.Response> getRawAddFavorite(String productId) async {
    Map<String, dynamic> map = {"product_id": productId};

    http.Response rawAddFavorite =
        await http.get(Uri.parse('${BasicUrl.basicUrl}/add/favourite/$map'));

    debugPrint(rawAddFavorite.body.toString());

    return rawAddFavorite;
  }

  Future<http.Response> getRawSingleProduct() async {
    http.Response rawSingleProduct =
        await http.get(Uri.parse("${BasicUrl.basicUrl}/product"));

    debugPrint("rawSingleProduct: ${rawSingleProduct.body}");

    return rawSingleProduct;
  }

  Future<http.Response> getBannersApi() async {
    http.Response bannerInfo =
        await http.get(Uri.parse("${BasicUrl.basicUrl}/get/banners"));

    debugPrint("bannerInfo:-------------------------- ${bannerInfo.body}");

    return bannerInfo;
  }

  Future<http.Response> getRawFavorites(List<dynamic> idList) async {
    Map<String, dynamic> map = {};

    for (var element in idList) {
      map.addAll({'list[$element]': element.toString()});
    }

    print('Map:::::::$map');
    http.Response rawFavorites = await http
        .post(Uri.parse("${BasicUrl.basicUrl}/get/product/list"), body: map);

    debugPrint(rawFavorites.body.toString());

    return rawFavorites;
  }

  Future<http.Response> getRawSearch(String query) async {
    http.Response rawSearch =
        await http.get(Uri.parse('${BasicUrl.basicUrl}/search/product/$query'));

    // debugPrint(rawSearch.body.toString());

    return rawSearch;
  }

  Future<http.Response> getRawBrand() async {
    http.Response rawBrands =
        await http.get(Uri.parse("${BasicUrl.basicUrl}/brand"));

    debugPrint(rawBrands.body.toString());

    return rawBrands;
  }

  Future<http.Response> postRawOrder(String userId, String orderType,
      String sum, String cashType, List<Map<String, dynamic>> items) async {
    Map<String, dynamic> map = {
      "user_id": 141,
      "order_type": "Доставка",
      "cash_type": "farqi yuq",
      "sum": 20000,
      "items": [
        {"product_id": 1, "qty": 3},
        {"product_id": 2, "qty": 3}
      ]
    };
    final encodeMap = jsonEncode(map);
    print('Send ---------------$encodeMap');
    http.Response rawOrder = await http.post(
        Uri.parse("${BasicUrl.basicUrl}/create/order"),
        body: encodeMap,
        headers: {'Content-type': 'application/json'});

    debugPrint('Order ---------${rawOrder.body}');

    return rawOrder;
  }

  Future<http.Response> getRawMyOrder(String userId) async {
    http.Response rawMyOrder = await http
        .post(Uri.parse('${BasicUrl.basicUrl}/get/orders?user_id=$userId'));

    debugPrint("My order -------${rawMyOrder.body}");

    return rawMyOrder;
  }
}
