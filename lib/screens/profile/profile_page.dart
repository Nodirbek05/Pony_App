import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/drawer/drawer_page.dart';
import 'package:ponygold/core/widgets/game_button/game_button.dart';
import 'package:ponygold/core/widgets/leaving_button/button_transparent.dart';
import 'package:ponygold/core/widgets/leaving_button/leaving_button_page.dart';
import 'package:ponygold/logic/service_cubit/auth_cubit/auth_cubit.dart';
import 'package:ponygold/screens/my_order/my_order_page.dart';

import '../auth/language_and_number/choose_language.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            drawer: const FirstDrawerPage(),
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(50.h),
            //   child: const AppBarForShop(
            //     title: "Мой профиль",
            //   ),
            // ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(27.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+998 87 888 99 09",
                        style: AppTextStyle.mediumSmall(),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10.0),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppIcons.edit,
                          color: AppColors.activeColorOfPin,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    bottom: ScreenUtil().setHeight(10),
                  ),
                  child: Text(
                    "ID: 123 454",
                    style: AppTextStyle.regular(),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: ScreenUtil().setHeight(405),
                    width: ScreenUtil().setWidth(360),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ScreenUtil().setHeight(10)),
                        topRight: Radius.circular(ScreenUtil().setHeight(10)),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(20),
                            left: ScreenUtil().setWidth(15),
                            right: ScreenUtil().setWidth(15),
                            bottom: ScreenUtil().setHeight(15),
                          ),
                          height: ScreenUtil().setHeight(56),
                          width: ScreenUtil().setWidth(328),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/fire.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                               "my_cupon".tr(),
                                style: AppTextStyle.medium(
                                  color: AppColors.white,
                                ),
                              ),
                              StartGameButton(
                                primary: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.splashColor1,
                                    AppColors.splashColor2,
                                  ],
                                ),
                                onPressed: () {},
                                style: AppTextStyle.regular(
                                  color: AppColors.white,
                                ),
                                label: "start_game".tr(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(16.0),
                            ),
                            child: Row(
                              children: [
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
                                   "${"your_bonus".tr()}3 000 000",
                                    style: AppTextStyle.mediumSmall(
                                      color: AppColors.ponygoldColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(5),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: ScreenUtil().setWidth(170),
                                        child: Text(
                                          "what_is_it_ponybonus".tr(),
                                          style: AppTextStyle.mediumSmall(
                                            color: AppColors.activeColorOfPin,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(8),
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.forwardarrow,
                                        color: AppColors.activeColorOfPin,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColors.dividerColor,
                          thickness: ScreenUtil().setHeight(1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyOrderPage(),
                                ),
                              );
                            },
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.handbag,
                                        color: AppColors.grey,
                                      ),
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      Text(
                                        "my_orders".tr(),
                                        style: AppTextStyle.mediumSmall(),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    AppIcons.forwardarrow,
                                    color: AppColors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColors.dividerColor,
                          thickness: ScreenUtil().setHeight(1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.handbag,
                                      color: AppColors.grey,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Text(
                                        "delivery_payment".tr(),
                                      style: AppTextStyle.mediumSmall(),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  AppIcons.forwardarrow,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColors.dividerColor,
                          thickness: ScreenUtil().setHeight(1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.w,
                          ),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.conversation,
                                      color: AppColors.grey,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Text(
                                      "live_chat".tr(),
                                      style: AppTextStyle.mediumSmall(),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  AppIcons.forwardarrow,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColors.dividerColor,
                          thickness: ScreenUtil().setHeight(1),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(25),
                        ),
                        TextButton(
                          onPressed: () {
                            AuthCubit _ = context.read<AuthCubit>();
                            _buildBottomSheet(_);
                          },
                          child: Text(
                           "exit".tr(),
                            style:
                                AppTextStyle.mediumSmall(color: AppColors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _buildBottomSheet(AuthCubit _) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ScreenUtil().setHeight(10)),
          topRight: Radius.circular(ScreenUtil().setHeight(10)),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil().setHeight(10)),
              topRight: Radius.circular(ScreenUtil().setHeight(10)),
            ),
          ),
          height: 200.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                  ),
                  child: Text(
                      "do_you_want_to_exit".tr(),
                    style: AppTextStyle.medium(
                      color: AppColors.blackV,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                ButtonTransparent(
                    side: Border.all(color: Colors.black),
                    colorOfButton: AppColors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.activeColorOfPin,
                    ),
                    label: "cancel".tr()),
                LeavinButtonPage(
                    primary: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.splashColor1,
                        AppColors.splashColor2,
                      ],
                    ),
                    onPressed: () async {
                      await _.fetchUserDelete();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanguagePage()),
                      );
                    },
                    style: AppTextStyle.regular(
                      color: AppColors.white,
                    ),
                    label: "exit".tr())
              ],
            ),
          ),
        );
      },
    );
  }
}
