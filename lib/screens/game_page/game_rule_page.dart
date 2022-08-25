import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/leaving_button/leaving_button_page.dart';

class GameRulePage extends StatefulWidget {
  const GameRulePage({super.key});

  @override
  State<GameRulePage> createState() => _GameRulePageState();
}

class _GameRulePageState extends State<GameRulePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
       
          left: ScreenUtil().setWidth(15.0),
          right: ScreenUtil().setWidth(15.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(15),
                right: ScreenUtil().setWidth(15),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(52),
                    width: ScreenUtil().setWidth(52),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27.r),
                      border: Border.all(
                        color: AppColors.ponygoldColor,
                      ),
                    ),
                    child: Text(
                      "1",
                      style: AppTextStyle.mediumSmall(
                        color: AppColors.ponygoldColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Expanded(
                    child: Text(
                      "Используя один купон вы получаете доступ на 10 уровней игры",
                      style: AppTextStyle.mediumSmall(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(15),
              ),
              height: ScreenUtil().setHeight(187),
              width: ScreenUtil().setWidth(328),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pony_image.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

             Padding(
            padding: EdgeInsets.only(
              
              top: ScreenUtil().setWidth(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(52),
                  width: ScreenUtil().setWidth(52),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.r),
                    border: Border.all(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                  child: Text(
                    "2",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(240),
                  child: Text(
                    "Получаете купон на 1 - ну игру. Переходите и переходите в раздел “Бонус”",
                    style: AppTextStyle.mediumSmall(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
             
              top: ScreenUtil().setWidth(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(52),
                  width: ScreenUtil().setWidth(52),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.r),
                    border: Border.all(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                  child: Text(
                    "3",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(240),
                  child: Text(
                    "Если у вас есть доступыне купоны, нажимаете на кнопку “Начать игру””",
                    style: AppTextStyle.mediumSmall(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
