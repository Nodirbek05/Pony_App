import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/data/models/single_product_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

class CarouselSliderPart extends StatelessWidget {
  const CarouselSliderPart({super.key, required this.photos});
final List<SingleDataPhoto> photos;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaruselchangeCubit, CaruselchangeState>(
      builder: (context, state) {
        final value = context.read<CaruselchangeCubit>();
        return CarouselSlider.builder(
          itemCount: photos.length,
          itemBuilder: (context, index, realIndex) => Container(
            height: ScreenUtil().setHeight(270),
            width: ScreenUtil().setWidth(360),
            decoration: const BoxDecoration(
              color: AppColors.white,
              // borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.network(
              photos[index].url.toString(),
              fit: BoxFit.contain,
            ),
          ),
          options: CarouselOptions(
            onPageChanged: (carouselDotIndex, reason) =>
                value.changeDetailCarousel(carouselDotIndex),
          ),
        );
      },
    );
  }
}
