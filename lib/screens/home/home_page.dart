import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/components/grid_list/grid_layer.dart';
import 'package:ponygold/core/components/lists/list_of_famous_products.dart';
import 'package:ponygold/core/components/male_female_others/male_female_others_page.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

import 'components/banner_component.dart';
import 'components/category_card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController controller = CarouselController();

  bool heart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerComponent(),
              //! Category List
              const CategoryCardComponent(),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    top: ScreenUtil().setHeight(24.0),
                    bottom: ScreenUtil().setHeight(16.0)),
                child: Text(
                 "popular_items".tr(),
                  style: AppTextStyle.semiBold(size: 18),
                ),
              ),

              const ListOfFamousProducts(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(25),
                  left: ScreenUtil().setWidth(15.0),
                  right: ScreenUtil().setWidth(15.0),
                ),
                height: ScreenUtil().setHeight(96),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/game_pic.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(25.0),
                    left: ScreenUtil().setWidth(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "receive_bonus".tr(),
                        style: AppTextStyle.regular(
                          size: 17,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(7),
                      ),
                      Text(
                        "1 000 000${"sum".tr()}",
                        style: AppTextStyle.semiBold(
                          size: 23,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setHeight(25.0),
                  bottom: ScreenUtil().setHeight(11.0),
                ),
                child: Text(
                  "sale".tr(),
                  style: AppTextStyle.semiBold(size: 18),
                ),
              ),
              const MaleFemaleList(),
              SizedBox(
                height: ScreenUtil().setHeight(20.0),
              ),

              const ListOfFamousProducts(),
              ScreenUtil().setVerticalSpacing(25),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  bottom: ScreenUtil().setHeight(15.0),
                ),
                child: Text(
                 "famous_brends".tr(),
                  style: AppTextStyle.semiBold(
                    size: 18,
                    color: AppColors.blackV,
                  ),
                ),
              ),
              const GridLayer(),
              SizedBox(
                height: ScreenUtil().setHeight(30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
