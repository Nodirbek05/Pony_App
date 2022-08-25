import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/logic/uicubit/changing_colors_cubit/choose_color_part_cubit.dart';

class ChoosingColor extends StatelessWidget {
  const ChoosingColor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseColorPartCubit, ChooseColorPartState>(
      builder: (context, state) {
        final valueOfColorState = context.read<ChooseColorPartCubit>();
        return Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(5.0),
            left: ScreenUtil().setWidth(15.0),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  valueOfColorState.changeColor('Белый');
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(38.0),
                      width: ScreenUtil().setWidth(38.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: valueOfColorState.numberOfColor == 'Белый'
                              ? AppColors.activeColorOfPin
                              : AppColors.colorOfButtonGrey,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.mainBackgroundColor,
                      ),
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5.0),
                    ),
                    Text(
                      tr("Белый"),
                      style: AppTextStyle.regular4(
                        color: AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfColorState.changeColor('Бирюзовый');
                },
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(38.0),
                        width: ScreenUtil().setWidth(38.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                valueOfColorState.numberOfColor == 'Бирюзовый'
                                    ? AppColors.activeColorOfPin
                                    : AppColors.colorOfButtonGrey,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.mainBackgroundColor,
                        ),
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.activeColorOfPin,
                        )),
                    SizedBox(
                      height: ScreenUtil().setHeight(5.0),
                    ),
                    Text(
                      tr("Бирюзовый"),
                      style: AppTextStyle.regular4(
                        color: AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfColorState.changeColor('Розовый');
                },
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(38.0),
                        width: ScreenUtil().setWidth(38.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: valueOfColorState.numberOfColor == 'Розовый'
                                ? AppColors.activeColorOfPin
                                : AppColors.colorOfButtonGrey,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.mainBackgroundColor,
                        ),
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.pinkColor,
                        )),
                    SizedBox(
                      height: ScreenUtil().setHeight(5.0),
                    ),
                    Text(
                      tr("Розовый"),
                      style: AppTextStyle.regular4(
                        color: AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              GestureDetector(
                onTap: () {
                  valueOfColorState.changeColor('Мотто - цинто');
                },
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(38.0),
                        width: ScreenUtil().setWidth(38.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: valueOfColorState.numberOfColor ==
                                    'Мотто - цинто'
                                ? AppColors.activeColorOfPin
                                : AppColors.colorOfButtonGrey,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.mainBackgroundColor,
                        ),
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.motto,
                        )),
                    SizedBox(
                      height: ScreenUtil().setHeight(5.0),
                    ),
                    Text(
                      tr("Мотто - цинто"),
                      style: AppTextStyle.regular4(
                        color: AppColors.colorOfButtonGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
