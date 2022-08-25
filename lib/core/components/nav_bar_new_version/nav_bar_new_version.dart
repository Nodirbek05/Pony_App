import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/components/decorations/my_decoration.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

class AppBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int> onPressed;

  const AppBottomNavBar({
    Key? key,
    required this.onPressed,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _setItem(AppIcons.home, 'Home', 0),
          _setItem(AppIcons.shoppingcard, 'Darslar', 1),
          _setItem(AppIcons.favorite, "Ma'lumotlar", 2),
          _setItem(AppIcons.user2, 'Media', 3),
        ],
      ),
    );
  }

  GestureDetector _setItem(String assetIcon, String label, int index) => GestureDetector(
        onTap: () {
          onPressed(index);
        },
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: AppDecorations.getBorderDecoration(
                height: 24.0.h,
                duration: 300,
                color: index == currentIndex ? AppColors.activeColorOfPin : null,
              ),
            ),
            SizedBox(height: 6.h),
            SvgPicture.asset(assetIcon,
                height: 20.h,
                width: 20.w,
                color:
                    index == currentIndex ? AppColors.activeColorOfPin : AppColors.colorOfButtonGrey),
            SizedBox(height: 7.h),
            Text(
              label,
              style: AppTextStyle.medium(
                size: index == currentIndex ? 12.0.sp : 10.5.sp,
                color:
                    index == currentIndex ? AppColors.activeColorOfPin : AppColors.colorOfButtonGrey,
              ),
            ),
          ],
        ),
      );
}
