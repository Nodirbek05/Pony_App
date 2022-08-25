import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

class SmallInfoAboutProduct extends StatelessWidget {
  const SmallInfoAboutProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15.0),
            left: ScreenUtil().setWidth(15.0),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'color'.tr(),
                  style: AppTextStyle.regular3(
                    color: AppColors.blackV,
                  ),
                ),
                TextSpan(
                  text:tr( "  Темно - синий, голубой"),
                  style: AppTextStyle.regular3(
                    color: AppColors.colorOfButtonGrey,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10.0),
            left: ScreenUtil().setWidth(15.0),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "material".tr(),
                  style: AppTextStyle.regular3(
                    color: AppColors.blackV,
                  ),
                ),
                TextSpan(
                  text: tr(" Хлопок, синтетическая ткань"),
                  style: AppTextStyle.regular3(
                    color: AppColors.colorOfButtonGrey,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10.0),
            left: ScreenUtil().setWidth(15.0),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "place_produced".tr(),
                  style: AppTextStyle.regular3(
                    color: AppColors.blackV,
                  ),
                ),
                TextSpan(
                  text: " Китай",
                  style: AppTextStyle.regular3(
                    color: AppColors.colorOfButtonGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
