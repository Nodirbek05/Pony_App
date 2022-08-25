import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ponygold/data/api_repository/api_repository.dart';
import 'package:ponygold/data/api_service/api_service.dart';
import 'package:ponygold/data/models/banner_model.dart';
import 'package:ponygold/data/models/failure_model.dart';

part 'get_banners_state.dart';

class GetBannersCubit extends Cubit<GetBannersState> {
  GetBannersCubit() : super(GetBannersInitial());
  final Repository apiRepository = ShopRepository(ShopApi());
  Future<void> fetchSingleProductInfo() async {
    emit(GetBannersLoading());
    try {
      final List<BannerDatum> bannerData = await apiRepository.getBanners();
      emit(GetBannersLoaded(banners: bannerData));
    } on Failure catch (failure) {
      emit(GetBannersError(failure));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
