import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

class EmptyShopPage extends StatelessWidget {
  const EmptyShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "shop_page_is_empty".tr(),
            style: AppTextStyle.mediumBig(
              color: AppColors.blackV,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
             "info_about_shop_order".tr(),
            style: AppTextStyle.regular3(
              color: AppColors.blackV,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15.h,
            ),
            height: 55.h,
            width: 328.w,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/rectangle.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: 
            Stack(
              children: [
                Positioned(
                  top: 18.h,
                  left: 18.w,
                  child: Text(
                   "how_to_get_bonus".tr(),
                    style: AppTextStyle.medium(
                      size: 16.h,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 150.w,
                    height: 55.h,
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
                  top: 20.h,
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
        ],
      ),
    );
  }
}
