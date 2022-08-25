part of 'brand_cubit.dart';

abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandLoaded extends BrandState {
  final List<BrandData> brandData;
  BrandLoaded(this.brandData);
}

class BrandFailure extends BrandState {
  final Failure error;
  BrandFailure(this.error);
}
