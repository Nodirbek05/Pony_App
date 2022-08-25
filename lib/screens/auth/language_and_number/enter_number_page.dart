// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/components/decorations/my_decoration.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/logic/service_cubit/auth_cubit/auth_cubit.dart';
import 'package:ponygold/logic/uicubit/changeLangButton/changelanguagebutton_cubit.dart';
import 'package:ponygold/screens/auth/receiveing_otp_code/receiving_otp_code_page.dart';

class EnteringNumberPage extends StatefulWidget {
  const EnteringNumberPage({super.key});

  @override
  State<EnteringNumberPage> createState() => _EnteringNumberPageState();
}

class _EnteringNumberPageState extends State<EnteringNumberPage> {
  @override
  void initState() {
    context.read<AuthCubit>().checkButtonState();
    super.initState();
  }

  @override
  void dispose() {
    context.read<AuthCubit>().disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChangelanguagebuttonCubit>();
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tr("enter_number"),
              style: AppTextStyle.medium(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              tr("info_about_sms"),
              style: AppTextStyle.regular(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.h,
            ),
            SizedBox(
              width: 328.w,
              child: TextField(
                style: AppTextStyle.regular(size: 15),
                maxLength: 9,
                keyboardType: TextInputType.phone,
                controller: context.watch<AuthCubit>().numberController,
                onTap: () {
                  context.read<AuthCubit>().removeIcon(false);
                },
                decoration: context.watch<AuthCubit>().preIconState
                    ? AppDecorations.defaultDecoration()
                    : AppDecorations.focusedDecoration(),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            AppBlueButton1(
              primary: context.watch<AuthCubit>().openButton
                  ? const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.splashColor1,
                        AppColors.splashColor2,
                      ],
                    )
                  : const LinearGradient(
                      colors: [
                        AppColors.colorOfButtonGrey,
                        AppColors.colorOfButtonGrey,
                      ],
                    ),
              onPressed: !context.watch<AuthCubit>().openButton
                  ? null
                  : () async {
                      await context.read<AuthCubit>().fetchAuth();
                      if (!context.read<AuthCubit>().isLogin) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReceivingCodePage(
                              controller: context
                                  .watch<AuthCubit>()
                                  .numberController
                                  .text,
                            ),
                          ),
                        );
                      }
                    },
              child: Text(
                "receive_code".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.h,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
