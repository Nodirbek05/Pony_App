import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/search_bar/search_bar.dart';

class AppBarForShop extends StatelessWidget {
  const AppBarForShop({super.key,  this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white, // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.blackV),
      centerTitle: true,
      title: Text(
        title!,
        style: AppTextStyle.medium(
          color: AppColors.blackV,
        ),
      ),
    );
  }
}
