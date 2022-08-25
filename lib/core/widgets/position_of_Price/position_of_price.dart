import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/leaving_button/leaving_button_page.dart';
import 'package:ponygold/data/models/basket_hive_model/basket_hive_model.dart';
import 'package:ponygold/data/models/single_product_model.dart';
import 'package:ponygold/logic/uicubit/adding_product_cubit/adding_product_cubit.dart';
import 'package:ponygold/logic/uicubit/database_cubit/database_cubit.dart';

import '../../../logic/uicubit/changing_colors_cubit/choose_color_part_cubit.dart';
import '../../../logic/uicubit/changing_size_cubit/changing_and_choosing_size_cubit.dart';

class PositionInPrice extends StatelessWidget {
  const PositionInPrice(
      {super.key, required this.data, required this.dataIndex});
  final List<SingleProductData> data;
  final int dataIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseCubit(),
      child: BlocBuilder<DatabaseCubit, DatabaseState>(
        builder: (_, state) {
          return Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackV.withOpacity(0.01),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: BlocBuilder<AddingProductCubit, AddingProductState>(
                builder: (context, state) {
                  final valueOfAddingProduct =
                      context.read<AddingProductCubit>();

                  return Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    height: ScreenUtil().setHeight(124),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                          ),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:  "total".tr(),
                                      style: AppTextStyle.mediumSmall(
                                        color: AppColors.colorOfgrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: valueOfAddingProduct.countProduct ==
                                              0
                                          ? data[dataIndex].price.toString()
                                          : (valueOfAddingProduct.countProduct *
                                                  int.parse(
                                                      data[dataIndex].price!))
                                              .toString(),
                                      style: AppTextStyle.mediumSmall(
                                        color: AppColors.blackV,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              InkWell(
                                onTap: () {
                                  valueOfAddingProduct.removeProduct();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: ScreenUtil().setHeight(28),
                                  width: ScreenUtil().setWidth(28),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.colorOfMinus,
                                  ),
                                  child: SvgPicture.asset(
                                    AppIcons.minus,
                                    color: AppColors.colorOfButtonGrey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                ),
                                child: Text(
                                  valueOfAddingProduct.countProduct.toString(),
                                  style: AppTextStyle.mediumSmall(
                                    color: AppColors.blackV,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  valueOfAddingProduct.addProduct();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: ScreenUtil().setHeight(28),
                                  width: ScreenUtil().setWidth(28),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
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
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          child: LeavinButtonPage(
                              onPressed: () {
                                addFavorite(
                                            _, valueOfAddingProduct);
                                // showDialog<String>(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       AlertDialog(
                                //     title:  Text(
                                //        "before_adding_to_basket".tr()),
                                //     content:  Text(
                                //        "before_cleaning_busket".tr()),
                                //     actions: <Widget>[
                                //       TextButton(
                                //         onPressed: () =>
                                //             Navigator.pop(context, 'Cancel'),
                                //         child: Text(
                                //           "no".tr(),
                                //           style: AppTextStyle.mediumSmall(
                                //             color: AppColors.blackV,
                                //           ),
                                //         ),
                                //       ),
                                //       TextButton(
                                //         onPressed: () {
                                //           // valueOfAddingProduct.cleanBasket();
                                //           // Navigator.pop(context, 'Ok');
                                //         },
                                //         child: Text(
                                //           "yes".tr(),
                                //           style: AppTextStyle.medium(
                                //             color: AppColors.activeColorOfPin,
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // );
                              },
                              primary: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: valueOfAddingProduct.countProduct == 0
                                    ? [
                                        AppColors.colorOfButtonGrey,
                                        AppColors.colorOfButtonGrey,
                                      ]
                                    : [
                                        AppColors.splashColor1,
                                        AppColors.splashColor2,
                                      ],
                              ),
                              style:
                                  AppTextStyle.regular1(color: AppColors.white),
                              label:  "in_busket".tr()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void addFavorite(
      BuildContext context, AddingProductCubit valueOfAddingProduct) {
    final size = context.read<ChangingAndChoosingSizeCubit>().selectedSize;
    final color = context.read<ChooseColorPartCubit>().numberOfColor;

    context.read<DatabaseCubit>().saveBasketCubit(BasketHiveModel(
        data[dataIndex].id!,
        data[dataIndex].name!,
        valueOfAddingProduct.countProduct,
        data[dataIndex].photos!.first.url!,
        size,
        color,
        data[dataIndex].price!));

    Navigator.pop(context);
  }
}
