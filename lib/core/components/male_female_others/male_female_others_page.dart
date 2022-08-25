import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

import '../../../logic/uicubit/changing_size_cubit/choosing_female_male_cubit.dart';

class MaleFemaleList extends StatelessWidget {
  const MaleFemaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosingFemaleMaleCubit, ChoosingFemaleMaleState>(
      builder: (context, state) {
        final value = context.read<ChoosingFemaleMaleCubit>();
        return Container(
          padding: EdgeInsets.only(left: 15.w),
          height: ScreenUtil().setHeight(32.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  value.changeFemale(1);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: value.selectedSize == 1
                        ? AppColors.colorOfBlue
                        : AppColors.white,
                    border: Border.all(
                      color: value.selectedSize == 1
                          ? AppColors.activeColorOfPin
                          : AppColors.colorOfButtonGrey,
                    ),
                  ),
                  child: Text(
                    tr("Для женщин"),
                    style: AppTextStyle.medium(
                      color: AppColors.colorOfButtonGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10.0),
              ),
              GestureDetector(
                onTap: () {
                  value.changeFemale(2);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().setWidth(210),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: value.selectedSize == 2
                        ? AppColors.colorOfBlue
                        : AppColors.white,
                    border: Border.all(
                      color: value.selectedSize == 2
                          ? AppColors.activeColorOfPin
                          : AppColors.colorOfButtonGrey,
                    ),
                  ),
                  child: Text(
                    tr("Весенняя лихорадка"),
                    style: AppTextStyle.medium(
                      color: AppColors.colorOfButtonGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10.0),
              ),
              GestureDetector(
                onTap: () {
                  value.changeFemale(3);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: value.selectedSize == 3
                        ? AppColors.colorOfBlue
                        : AppColors.white,
                    border: Border.all(
                      color: value.selectedSize == 3
                          ? AppColors.activeColorOfPin
                          : AppColors.colorOfButtonGrey,
                    ),
                  ),
                  child: Text(
                    tr("Для мужчин"),
                    style: AppTextStyle.medium(
                      color: AppColors.colorOfButtonGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
