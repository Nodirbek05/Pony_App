import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

import '../../../logic/uicubit/changing_size_cubit/changing_and_choosing_size_cubit.dart';

class ChooseSize extends StatelessWidget {
  const ChooseSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10.0),
        left: ScreenUtil().setWidth(15.0),
        right: ScreenUtil().setWidth(15.0),
      ),
      child: BlocBuilder<ChangingAndChoosingSizeCubit,
          ChangingAndChoosingSizeState>(
        builder: (context, state) {
          final valueOfSizeState = context.read<ChangingAndChoosingSizeCubit>();
          return Row(
        
            children: [
              GestureDetector(
                onTap: () {
                  valueOfSizeState.changeSize('S');
                },
                child: Container(
                  height: ScreenUtil().setHeight(40.0),
                  width: ScreenUtil().setWidth(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: valueOfSizeState.selectedSize == 'S'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey),
                      borderRadius: BorderRadius.circular(5.r),
                      color: valueOfSizeState.selectedSize == 'S'
                          ? AppColors.activeColorOfPin
                          : AppColors.white),
                  child: Center(
                    child: Text(
                      "S",
                      style: AppTextStyle.semiBold(
                        color: valueOfSizeState.selectedSize == 'S'
                            ? AppColors.white
                            : AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfSizeState.changeSize('M');
                },
                child: Container(
                  height: ScreenUtil().setHeight(40.0),
                  width: ScreenUtil().setWidth(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: valueOfSizeState.selectedSize == 'M'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey),
                      borderRadius: BorderRadius.circular(5.r),
                      color: valueOfSizeState.selectedSize == 'M'
                          ? AppColors.activeColorOfPin
                          : AppColors.white),
                  child: Center(
                    child: Text(
                      "M",
                      style: AppTextStyle.semiBold(
                        color: valueOfSizeState.selectedSize == 'M'
                            ? AppColors.white
                            : AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfSizeState.changeSize('L');
                },
                child: Container(
                  height: ScreenUtil().setHeight(40.0),
                  width: ScreenUtil().setWidth(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: valueOfSizeState.selectedSize == 'L'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey),
                      borderRadius: BorderRadius.circular(5.r),
                      color: valueOfSizeState.selectedSize == 'L'
                          ? AppColors.activeColorOfPin
                          : AppColors.white),
                  child: Center(
                    child: Text(
                      "L",
                      style: AppTextStyle.semiBold(
                        color: valueOfSizeState.selectedSize == 'L'
                            ? AppColors.white
                            : AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfSizeState.changeSize('XL');
                  // showModalOfPrice(
                  //   context,
                  //   context.read<AddingProductCubit>(),
                  //   widget.data,
                  // );
                },
                child: Container(
                  height: ScreenUtil().setHeight(40.0),
                  width: ScreenUtil().setWidth(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: valueOfSizeState.selectedSize == 'XL'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey),
                      borderRadius: BorderRadius.circular(5.r),
                      color: valueOfSizeState.selectedSize == 'XL'
                          ? AppColors.activeColorOfPin
                          : AppColors.white),
                  child: Center(
                    child: Text(
                      "XL",
                      style: AppTextStyle.semiBold(
                        color: valueOfSizeState.selectedSize == 'XL'
                            ? AppColors.white
                            : AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfSizeState.changeSize('XXL');
                },
                child: Container(
                  height: ScreenUtil().setHeight(40.0),
                  width: ScreenUtil().setWidth(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: valueOfSizeState.selectedSize == 'XXL'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey),
                      borderRadius: BorderRadius.circular(5.r),
                      color: valueOfSizeState.selectedSize == 'XXL'
                          ? AppColors.activeColorOfPin
                          : AppColors.white),
                  child: Center(
                    child: Text(
                      "XXL",
                      style: AppTextStyle.semiBold(
                        color: valueOfSizeState.selectedSize == 'XXL'
                            ? AppColors.white
                            : AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
