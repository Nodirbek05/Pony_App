import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/leaving_button/leaving_button_page.dart';
import 'package:ponygold/logic/uicubit/changing_game_cubit/changing_game_page_cubit.dart';
import 'package:ponygold/screens/game_page/game_info_classPage.dart';
import 'package:ponygold/screens/game_page/game_rule_page.dart';

class GameInfoPage extends StatefulWidget {
  const GameInfoPage({super.key});

  @override
  State<GameInfoPage> createState() => _GameInfoPageState();
}

class _GameInfoPageState extends State<GameInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangingGamePageCubit, ChangingGamePageState>(
        builder: (context, state) {
      final value = context.read<ChangingGamePageCubit>();
      return Container(
        width: ScreenUtil().setWidth(double.infinity),
        height: ScreenUtil().setHeight(double.infinity),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/gameBack.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(30.0),
            left: ScreenUtil().setWidth(15.0),
            right: ScreenUtil().setWidth(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(273.0),
                  child: Text(
                    "Войдите в аккаунт, чтобыувидеть доступные купоны",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                LeavinButtonPage(
                  primary: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.gameColor1,
                      AppColors.gameColor2,
                    ],
                  ),
                  onPressed: () {},
                  style: AppTextStyle.mediumSmall(
                    color: AppColors.white,
                  ),
                  label: "Войти",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.h,
                    right: 15.w,
                    bottom: 20.h,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.changePage(0);
                        },
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Что такое PG?",
                                style: AppTextStyle.mediumSmall(
                                  color: AppColors.gameColor1,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: ScreenUtil().setWidth(156),
                                height: ScreenUtil().setHeight(1),
                                color: value.page == 0
                                    ? AppColors.gameColor1
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changePage(1);
                        },
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Правила игры",
                                style: AppTextStyle.mediumSmall(
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: ScreenUtil().setWidth(156),
                                height: ScreenUtil().setHeight(1),
                                color: value.page == 1
                                    ? AppColors.gameColor1
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Column(
                  children: [
                    value.page == 0
                        ? const GameInfoClassPage()
                        : const GameRulePage(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
