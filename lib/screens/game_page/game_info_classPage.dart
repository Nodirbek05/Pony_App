import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/leaving_button/leaving_button_page.dart';
import 'package:ponygold/core/widgets/payment_container/payment_container_page.dart';

class GameInfoClassPage extends StatelessWidget {
  const GameInfoClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              top: ScreenUtil().setWidth(5),
              bottom: ScreenUtil().setHeight(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: ScreenUtil().setHeight(35.0),
                  width: ScreenUtil().setWidth(35.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.ponylogo,
                    height: ScreenUtil().setHeight(35.0),
                    color: AppColors.ponygoldColor,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(8),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(270),
                  child: Text(
                    "Pony Gold (PG) - это бонусы, которые вы можете получить в игре и обменять на реальные заказы при оформлении.",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
         
         const PaymentCardPage(),
         
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
              top: ScreenUtil().setWidth(15),
            ),
            child: Text(
              "Как их получить?",
              style: AppTextStyle.mediumSmall(
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
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
                    "1",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(240),
                  child: Text(
                    "Оформляете заказ на сумму от 100 000 сум",
                    style: AppTextStyle.mediumSmall(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
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
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
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
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
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
                    "4",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(240),
                  child: Text(
                    "В процессе прохождения, вы можете получить бонусные PG, выбирая одну из карточек. Если она победная, то вы получаете бонус",
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
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
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
                    "5",
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.ponygoldColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(240),
                  child: Text(
                    "Дойдя до 10 уровня вы можете получить суперприз! ",
                    style: AppTextStyle.mediumSmall(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10.0),
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
            label: "3 000 000 PG (равен 1 000 000 сум)",
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
                image: AssetImage('assets/images/pony_image2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
              top: ScreenUtil().setWidth(15),
            ),
            child: SizedBox(
              width: ScreenUtil().setWidth(273.0),
              child: Text(
                "Начните получать бонусы и обменивать их на реальные товары!",
                style: AppTextStyle.medium(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
              top: ScreenUtil().setWidth(15),
            ),
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(259.0),
              child: Text(
                "Войдите в аккаунт, чтобы увидеть доступные купоны",
                style: AppTextStyle.regular(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
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
        ],
      ),
    );
  }
}
