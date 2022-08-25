import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/leaving_button/button_transparent.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SingleOrderPage extends StatefulWidget {
  const SingleOrderPage({super.key});

  @override
  State<SingleOrderPage> createState() => _SingleOrderPageState();
}

class _SingleOrderPageState extends State<SingleOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child:  AppBarForShop(
          title: tr("Заказ №182"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "01.02.2022, 19:00",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.dateColor,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: tr("Статус:"),
                          style: AppTextStyle.regular(
                            color: AppColors.colorOfgrey,
                          ),
                        ),
                        TextSpan(
                          text: tr(" Новый"),
                          style: AppTextStyle.mediumSmall(
                            color: AppColors.blackV,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              Container(
                height: ScreenUtil().setHeight(99),
                width: ScreenUtil().setWidth(328),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr("Курьер:"),
                        style: AppTextStyle.mediumSmall(
                          color: AppColors.colorOfButtonGrey,
                        ),
                      ),
                      Text(
                        "Джахангир Абдукадыров",
                        style: AppTextStyle.mediumSmall(
                          color: AppColors.blackV,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.phone,
                            color: AppColors.greenColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("+998 87 887 88 90",
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 15.h,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              Container(
                height: ScreenUtil().setHeight(271),
                width: ScreenUtil().setWidth(328),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       tr( "Адрес:"),
                        style: AppTextStyle.mediumSmall(
                          color: AppColors.colorOfButtonGrey,
                        ),
                      ),
                      Text(
                        "Яккасарайский район, м-в Кушбеги",
                        style: AppTextStyle.regular(
                          color: AppColors.blackV,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(179),
                        width: ScreenUtil().setWidth(310),
                        child: Material(
                          // decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          //   color: AppColors.white,
                          // ),
                          child: YandexMap(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              Container(
                height: ScreenUtil().setHeight(220),
                width: ScreenUtil().setWidth(328),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(150),
                            child: Text(
                              "Лоферы Ralf Ringer женские",
                              style: AppTextStyle.regular(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          
                          SizedBox(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "х3",
                                    style: AppTextStyle.regular(
                                      color: AppColors.dateColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 12 000 000 сум",
                                    style: AppTextStyle.regular(
                                      color: AppColors.blackV,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        bottom: 10.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Размер: XL",
                            style: AppTextStyle.regular(
                              color: AppColors.colorOfgrey,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Цвет:",
                                  style: AppTextStyle.regular(
                                    color: AppColors.colorOfgrey,
                                  ),
                                ),
                                TextSpan(
                                  text: " Черный",
                                  style: AppTextStyle.regular(
                                    color: AppColors.blackV,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(150),
                            child: Text(
                              "Лоферы Ralf Ringer женские",
                              style: AppTextStyle.regular(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          
                          SizedBox(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "х3",
                                    style: AppTextStyle.regular(
                                      color: AppColors.dateColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 12 000 000 сум",
                                    style: AppTextStyle.regular(
                                      color: AppColors.blackV,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        bottom: 10.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            tr("Размер: XL"),
                            style: AppTextStyle.regular(
                              color: AppColors.colorOfgrey,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: tr("Цвет:"),
                                  style: AppTextStyle.regular(
                                    color: AppColors.colorOfgrey,
                                  ),
                                ),
                                TextSpan(
                                  text: " Черный",
                                  style: AppTextStyle.regular(
                                    color: AppColors.blackV,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           tr( "Итого"),
                            style: AppTextStyle.medium(
                              color: AppColors.blackV,
                            ),
                          ),
                          Text(
                            "12 20 000 сум",
                            style: AppTextStyle.medium(
                              color: AppColors.blackV,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(328),
                child: Text(
                  tr("Для отмены заказа свяжитесьс нашим менеджером"),
                  style: AppTextStyle.regular(
                    color: AppColors.blackV,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              ButtonTransparent(
                colorOfButton: AppColors.white,
                onPressed: () {},
                style: AppTextStyle.regular(
                  color: AppColors.activeColorOfPin,
                ),
                label: tr("Отменить заказ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
