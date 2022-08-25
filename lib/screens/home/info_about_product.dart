import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/components/choose_color_part/choose_color.dart';
import 'package:ponygold/core/components/choose_size_part/choose_size_part.dart';
import 'package:ponygold/core/components/lists/list_of_famous_products.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/icons_in_info_part/icons_in_position.dart';
import 'package:ponygold/core/widgets/position_of_Price/position_of_price.dart';
import 'package:ponygold/core/widgets/small_info_about_product/small_info_about_product.dart';
import 'package:ponygold/data/models/single_product_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constant/app_icons.dart';

class InfoAboutSimplePro extends StatefulWidget {
  const InfoAboutSimplePro(
      {super.key, required this.data, required this.dataIndex});

  final List<SingleProductData> data;

  final int dataIndex;

  @override
  State<InfoAboutSimplePro> createState() => _InfoAboutSimpleProState();
}

class _InfoAboutSimpleProState extends State<InfoAboutSimplePro> {
  @override
  Widget build(BuildContext context) {
    final value = context.watch<CaruselchangeCubit>();
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: IconsInPosition(
                          photos: widget.data[widget.dataIndex].photos!),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10.0),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: ScreenUtil().setHeight(2),
                            child: AnimatedSmoothIndicator(
                              activeIndex: value.detailCarouselIndex,
                              count:
                                  widget.data[widget.dataIndex].photos!.length,
                              effect: ExpandingDotsEffect(
                                dotColor: AppColors.deactiveIndicator,
                                activeDotColor: AppColors.activeColorOfPin,
                                dotHeight: ScreenUtil().setHeight(5.0),
                                dotWidth: ScreenUtil().setWidth(10.0),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(12.0),
                              left: ScreenUtil().setWidth(15.0),
                              right: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              widget.data[widget.dataIndex].name.toString(),
                              style: AppTextStyle.mediumSmall(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              "АРТИКУЛ: 123 456",
                              style: AppTextStyle.regular4(
                                color: AppColors.colorOfButtonGrey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(5.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              "choose_color".tr(),
                              style: AppTextStyle.semiBold(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const ChoosingColor(),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              "size".tr(),
                              style: AppTextStyle.semiBold(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const ChooseSize(),
                          const SmallInfoAboutProduct(),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(10.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            height: ScreenUtil().setHeight(50.0),
                            width: ScreenUtil().setWidth(328),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"discount".tr(),
                                        style: AppTextStyle.semiBold(
                                          color: AppColors.blackV,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget
                                            .data[widget.dataIndex].discount,
                                        style: AppTextStyle.semiBold(
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 0.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                         "12 300 000${"sum".tr()}",
                                        style: AppTextStyle.medium(
                                          color: AppColors.blackV,
                                        ),
                                      ),
                                      widget.data[widget.dataIndex].discount !=
                                              "0"
                                          ? Text(
                                              widget.data[widget.dataIndex]
                                                  .discount
                                                  .toString(),
                                              style: TextStyle(
                                                color:
                                                    AppColors.colorOfButtonGrey,
                                                fontSize:
                                                    ScreenUtil().setWidth(14),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              "info_about_product".tr(),
                              style: AppTextStyle.mediumSmall(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(15.0),
                              top: ScreenUtil().setHeight(8.0),
                            ),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(328),
                              child: Text(
                                widget.data[widget.dataIndex].description
                                    .toString(),
                                style: AppTextStyle.regularwithSpacing(
                                  color: AppColors.blackV,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(10.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                   "more_info".tr(),
                                  style: AppTextStyle.mediumWithUnderdots(
                                    color: AppColors.activeColorOfPin,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            child: Text(
                              "brend".tr(),
                              style: AppTextStyle.medium(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(10.0),
                              left: ScreenUtil().setWidth(15.0),
                            ),
                            height: ScreenUtil().setHeight(70.0),
                            width: ScreenUtil().setWidth(328),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/images/levis_logo.png",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 0.h,
                                    ),
                                    child: SizedBox(
                                      width: ScreenUtil().setWidth(220),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "item_with_brend".tr(),
                                            style: AppTextStyle.medium(
                                              color: AppColors.blackV,
                                            ),
                                            
                                          ),
                                         
                                          SvgPicture.asset(
                                            AppIcons.forwardarrow,
                                            color: AppColors.blackV,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20.0),
                              left: ScreenUtil().setWidth(15.0),
                              bottom: ScreenUtil().setHeight(15.0),
                            ),
                            child: Text(
                              "similar_items".tr(),
                              style: AppTextStyle.medium(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const ListOfFamousProducts(),
                          SizedBox(
                            height: ScreenUtil().setHeight(130.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionInPrice(data: widget.data, dataIndex: widget.dataIndex),
          ],
        ),
      ),
    );
  }
}
