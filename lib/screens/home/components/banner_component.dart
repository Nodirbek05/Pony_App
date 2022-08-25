import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/widgets/shimmer_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../data/models/banner_model.dart';
import '../../../../logic/service_cubit/get_banners_cubit/get_banners_cubit.dart';
import '../../../../logic/uicubit/carouselChange/caruselchange_cubit.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBannersCubit, GetBannersState>(
      builder: (context, state) {
        if (state is GetBannersLoaded) {
          return Column(
            children: [
              //! Carousel Images
              carouselBuilder(state.banners, context),
              ScreenUtil().setVerticalSpacing(10.0),

              //! Carousel Dots
              _buildCarouselDots(state.banners, context),
              ScreenUtil().setVerticalSpacing(20.0),
            ],
          );
        } else if (state is GetBannersLoading) {
          return _buildShimmer();
        }
        return const Text('NO DATA');
      },
    );
  }

  ShimmerWidget _buildShimmer() {
    return ShimmerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(140),
          ),
          ScreenUtil().setVerticalSpacing(10.0),
          Container(
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.white),
          ),
          ScreenUtil().setVerticalSpacing(20.0),
        ],
      ),
    );
  }

  CarouselSlider carouselBuilder(
      List<BannerDatum> banners, BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(banners[index].url.toString()),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          width: ScreenUtil().setWidth(328.0),
        );
      },
      options: CarouselOptions(
        height: ScreenUtil().setHeight(140.0),
        viewportFraction: 1,
        autoPlay: false,
        onPageChanged: ((activeIndex, reason) {
          context.read<CaruselchangeCubit>().changeHomeCarousel(activeIndex);
        }),
      ),
    );
  }

  Container _buildCarouselDots(
      List<BannerDatum> banners, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(4),
      child: AnimatedSmoothIndicator(
        activeIndex: context.watch<CaruselchangeCubit>().homeCarouselIndex,
        count: banners.length,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.deactiveIndicator,
          activeDotColor: AppColors.activeColorOfPin,
          dotHeight: ScreenUtil().setHeight(5.0),
          dotWidth: ScreenUtil().setWidth(10.0),
        ),
      ),
    );
  }
}
