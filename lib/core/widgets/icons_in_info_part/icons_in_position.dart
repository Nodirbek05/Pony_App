import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/carousel_slider/carousel_part.dart';
import 'package:ponygold/data/models/single_product_model.dart';

class IconsInPosition extends StatelessWidget {
  const IconsInPosition({super.key, required this.photos});
  final List<SingleDataPhoto> photos; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSliderPart(photos: photos),
        Positioned(
          top: ScreenUtil().setHeight(20.0),
          left: ScreenUtil().setWidth(20.0),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: ScreenUtil().setWidth(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppIcons.backButton,
                color: AppColors.blackV,
              ),
            ),
          ),
        ),
        Positioned(
          right: ScreenUtil().setWidth(70.0),
          top: ScreenUtil().setHeight(20.0),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: ScreenUtil().setWidth(20),
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: ScreenUtil().setWidth(20),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppIcons.share,
                  color: AppColors.blackV,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: ScreenUtil().setWidth(20.0),
          top: ScreenUtil().setHeight(20.0),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: ScreenUtil().setWidth(20),
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: ScreenUtil().setWidth(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppIcons.vector,
                  color: AppColors.blackV,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
