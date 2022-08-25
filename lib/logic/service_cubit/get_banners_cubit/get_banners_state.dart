part of 'get_banners_cubit.dart';

@immutable
abstract class GetBannersState {}

class GetBannersInitial extends GetBannersState {}


class GetBannersLoading extends GetBannersState {}

class GetBannersLoaded extends GetBannersState {
  final List<BannerDatum> banners;

  GetBannersLoaded({ required this.banners});
}

class GetBannersError extends GetBannersState {
  final Failure failure;
  GetBannersError(this.failure);
}