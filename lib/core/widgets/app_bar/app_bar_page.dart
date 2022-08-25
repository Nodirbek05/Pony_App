import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/search_bar/search_bar.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar(
      {super.key,
      this.text,
      // this.onTab,
      this.leading,
      // this.onPress,
      this.action,
      this.textSize = 20});

  final String? text;
  final double? textSize;
  // VoidCallback? onTab, onPress;
  final Widget? leading, action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white, // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
      backgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.blackV),
      // title: Text("Hello"),
      // centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(8.0),
            bottom: ScreenUtil().setHeight(5.0),
            right: ScreenUtil().setWidth(18.0),
          ),
          width: ScreenUtil().setWidth(295),
          child: TextFormField(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            readOnly: true,
            enableInteractiveSelection: true,
            cursorColor: AppColors.colorOfButtonGrey,
            // keyboardType: TextInputType.phone,
            // controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: AppColors.mainTextColor,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: AppColors.colorOfButtonGrey,
                ),
              ),
              fillColor: AppColors.colorOfTextform,
              filled: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.search,
                ),
              ),
              contentPadding: EdgeInsets.only(left: 10.w, top: 4.h),
              hintStyle: AppTextStyle.regular(size: 14),
              hintText: "search_in_pony_gold".tr(),
              labelStyle: AppTextStyle.regular(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
