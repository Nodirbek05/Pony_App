import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/logic/uicubit/changeLangButton/changelanguagebutton_cubit.dart';
import 'package:ponygold/screens/auth/language_and_number/enter_number_page.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    context.read<ChangelanguagebuttonCubit>().catchContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      backgroundColor: AppColors.mainBackgroundColor,
      body: BlocBuilder<ChangelanguagebuttonCubit, ChangelanguagebuttonState>(
        builder: (context, state) {
          final valueOfColor1 =
              context.read<ChangelanguagebuttonCubit>().changeColor1;
          final valueOfColor2 =
              context.read<ChangelanguagebuttonCubit>().changeColor2;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Выберите язык",
                  style: AppTextStyle.medium(),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Tilni tanlangi",
                  style: AppTextStyle.regular(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppBlueButton1(
                  side: Border.all(
                      color: valueOfColor1 == false
                          ? Colors.black
                          : Colors.transparent),
                  primary: valueOfColor1 == true
                      ? const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.splashColor1,
                            AppColors.splashColor2,
                          ],
                        )
                      : const LinearGradient(
                          colors: [AppColors.white, AppColors.white],
                        ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnteringNumberPage(),
                      ),
                    );

                    setState(() {
                      context.setLocale(const Locale('ru', 'RU'));
                    });
                  },
                  child: Text(
                    "Русский",
                    style: TextStyle(
                      color:
                          valueOfColor1 == false ? Colors.black : Colors.white,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppBlueButton1(
                  side: Border.all(
                      color:
                          valueOfColor2 == false ? Colors.black : Colors.white),
                  primary: valueOfColor2 == true
                      ? const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.splashColor1,
                            AppColors.splashColor2,
                          ],
                        )
                      : const LinearGradient(
                          colors: [AppColors.white, AppColors.white],
                        ),
                  onPressed: () async {
                    context
                        .read<ChangelanguagebuttonCubit>()
                        .changingButtonColor2();
                    //  await context
                    //   .read<ChangelanguagebuttonCubit>()
                    //   .selectLanguage(const Locale('uz', 'UZ'));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnteringNumberPage(),
                      ),
                    );

                    setState(() {
                      context.setLocale(const Locale('uz', 'UZ'));
                    });
                  },
                  child: Text(
                    "O'zbekcha",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
