import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/logic/uicubit/database_cubit/database_cubit.dart';
import 'package:ponygold/screens/shop/confirm_order.dart';

import '../../core/constant/app_icons.dart';
import '../../data/models/basket_hive_model/basket_hive_model.dart';

class ShopWithItems extends StatelessWidget {
  const ShopWithItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (_, state) {
        final value = _.read<DatabaseCubit>();
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.databaseBaskets.length,
                  itemBuilder: (context, index) {
                    final valueList = value.databaseBaskets;
                    return GestureDetector(
                      onTap: () {
                        showModalOnAlways(
                            context, value.databaseBaskets, value.sumOfProduct);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 15.h,
                        ),
                        height: ScreenUtil().setHeight(171),
                        width: ScreenUtil().setWidth(328),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 12.w,
                                    top: 12.h,
                                  ),
                                  height: ScreenUtil().setHeight(70.0),
                                  width: ScreenUtil().setWidth(70.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.mainBackgroundColor,
                                    image: DecorationImage(
                                      image: MemoryImage(
                                          valueList[index].imageFile!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.w,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: ScreenUtil().setWidth(222),
                                        child: Text(
                                          valueList[index].name.toString(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.blackV,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(5.0),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(222),
                                        child: Text(
                                          valueList[index].price.toString(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.colorOfButtonGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.w,
                                    top: 12.h,
                                  ),
                                  child: Text(
                                    "size".tr() + valueList[index].size.tr(),
                                    style: AppTextStyle.mediumSmall(
                                      color: AppColors.colorOfButtonGrey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    top: 12.h,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "color_of_item".tr(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.colorOfgrey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: valueList[index].color,
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.blackV,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.dividerColor,
                              thickness: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      value.deleteFavoriteCubit(
                                          valueList[index].id);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 12.w,
                                        right: ScreenUtil().setWidth(5),
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.trash,
                                        color: AppColors.colorOfgrey,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "total".tr(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.colorOfgrey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: valueList[index].count == 0
                                              ? valueList[index]
                                                  .price
                                                  .toString()
                                              : (valueList[index].count *
                                                      int.parse(valueList[index]
                                                          .price))
                                                  .toString(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.blackV,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      if (valueList[index].count > 1) {
                                        valueList[index].count -= 1;
                                        value.updateFavoriteCubit(
                                            valueList[index]);
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: ScreenUtil().setHeight(28),
                                      width: ScreenUtil().setWidth(28),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: AppColors.mainBackgroundColor,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.minus,
                                        color: AppColors.blackV,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                    ),
                                    child: Text(
                                      valueList[index].count.toString(),
                                      style: AppTextStyle.mediumSmall(
                                        color: AppColors.colorOfgrey,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      valueList[index].count += 1;
                                      value.updateFavoriteCubit(
                                          valueList[index]);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: ScreenUtil().setHeight(28),
                                      width: ScreenUtil().setWidth(28),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: AppColors.activeColorOfPin,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.plus,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
                top: 12.h,
                bottom: 20.h,
              ),
              child: Row(
                children: [
                  Text(
                    "all_price".tr(),
                    style: AppTextStyle.medium(
                      color: AppColors.blackV,
                    ),
                  ),
                  Text(
                    value.sumOfProduct.toString(),
                    style: AppTextStyle.medium(
                      color: AppColors.blackV,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showModalOnAlways(BuildContext context,
      List<BasketHiveModel> databaseBasket, int sumOfProduct) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: ScreenUtil().setHeight(74),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: AppBlueButton1(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmOrderPage(
                        dataBaseBasket: databaseBasket,
                        sum: sumOfProduct.toString()),
                  ),
                );
              },
              primary: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.splashColor1,
                  AppColors.splashColor2,
                ],
              ),
              child: Text(
                "pass_to_confirm".tr(),
                style: AppTextStyle.regular1(color: AppColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
