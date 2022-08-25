import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/screens/my_order/order_page.dart';

import '../../data/models/my_order_model.dart';

class ActiveOrders extends StatelessWidget {
  final List<Order> activeOrder;
  const ActiveOrders({super.key, required this.activeOrder});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SingleOrderPage();
              },
            ),
          );
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: activeOrder.length,
          itemBuilder: (context, index) {
            final List<Order> reversedList = activeOrder.reversed.toList();
            return Container(
              margin: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 10.h,
              ),
              height: ScreenUtil().setHeight(86),
              width: ScreenUtil().setWidth(328),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: 8.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${"order".tr()} №${reversedList[index].id}",
                          style: AppTextStyle.mediumSmall(
                            color: AppColors.blackV,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "status".tr(),
                                style: AppTextStyle.regular(
                                  color: AppColors.colorOfgrey,
                                ),
                              ),
                              TextSpan(
                                text: "new".tr(),
                                style: AppTextStyle.regular(
                                  color: AppColors.blackV,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.dividerColor,
                    thickness: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      top: 8.h,
                      right: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "01.02.2022, 19:00",
                          style: AppTextStyle.mediumSmall(
                            color: AppColors.dateColor,
                          ),
                        ),
                        Text(
                          "${reversedList[index].sum} ${"sum".tr()}",
                          style: AppTextStyle.mediumSmall(
                            color: AppColors.colorOfgrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
