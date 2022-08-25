import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

import '../../../logic/uicubit/choosing_payment_cubit/choosing_payment_part_cubit.dart';

class PaymentCardPage extends StatelessWidget {
  const PaymentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosingPaymentPartCubit, ChoosingPaymentPartState>(
      builder: (context, state) {
        final valueOfPaymetType = context.read<ChoosingPaymentPartCubit>();
        return Container(
          height: ScreenUtil().setHeight(227),
          width: ScreenUtil().setWidth(328),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setWidth(15),
                ),
                child: Text(
                 "type_of_payment".tr(),
                  style: AppTextStyle.medium(),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setWidth(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        valueOfPaymetType.changePaymentType(0);
                        // showModalOnAlways(context);
                      },
                      child: valueOfPaymetType.paymentType == 0
                          ? Container(
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                color: AppColors.activeColorOfPin,
                                border: Border.all(
                                  color: AppColors.white,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.done,
                                color: AppColors.white,
                                size: 15.h,
                              ),
                            )
                          : Container(
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.colorOfgrey,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(8),
                    ),
                    Text(
                      "cash_payment".tr(),
                      style: AppTextStyle.regular(color: AppColors.blackV),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setWidth(5),
                  bottom: 8.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        valueOfPaymetType.changePaymentType(1);
                        // showModalOnAlways(context);
                      },
                      child: valueOfPaymetType.paymentType == 1
                          ? Container(
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                color: AppColors.activeColorOfPin,
                                border: Border.all(
                                  color: AppColors.white,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.done,
                                color: AppColors.white,
                                size: 15.h,
                              ),
                            )
                          : Container(
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.colorOfgrey,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(8),
                    ),
                    SizedBox(
                      child: Image.asset("assets/images/payme.png"),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.colorOfgrey,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        valueOfPaymetType.changePaymentType(2);
                        // showModalOnAlways(context);
                      },
                      child: valueOfPaymetType.paymentType == 2
                          ? Container(
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                color: AppColors.activeColorOfPin,
                                border: Border.all(
                                  color: AppColors.white,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.done,
                                color: AppColors.white,
                                size: 15.h,
                              ),
                            )
                          : Container(
                              height: ScreenUtil().setHeight(20.0),
                              width: ScreenUtil().setWidth(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.colorOfgrey,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(8),
                    ),
                    SizedBox(
                      child: Text(
                        "bonus_pony_gold".tr(),
                        style: AppTextStyle.regular(),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(35.0),
                      width: ScreenUtil().setWidth(35.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/coin.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(86),
                      child: Text(
                        "your_bonus".tr(),
                        style: AppTextStyle.mediumSmall(
                          color: AppColors.ponygoldColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 41.h,
                  width: 328.w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/rectangle.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10.h,
                        left: 18.w,
                        child: Text(
                           "how_to_get_bonus".tr(),
                          style: AppTextStyle.mediumBig(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 150.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.r),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/coins.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16.w,
                        top: 10.h,
                        child: SvgPicture.asset(
                          AppIcons.forwardarrow,
                          color: AppColors.white,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ],
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
