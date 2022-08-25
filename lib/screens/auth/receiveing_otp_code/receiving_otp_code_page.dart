import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/logic/service_cubit/auth_cubit/auth_cubit.dart';

import '../../../core/widgets/nav_bar_buttom/nav_bar_page.dart';

class ReceivingCodePage extends StatefulWidget {
  const ReceivingCodePage({super.key, required this.controller});

  final String controller;

  @override
  State<ReceivingCodePage> createState() => _ReceivingCodePageState();
}

class _ReceivingCodePageState extends State<ReceivingCodePage> {
  @override
  void dispose() {
    context.read<AuthCubit>().disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(45),
          left: ScreenUtil().setWidth(15),
          right: ScreenUtil().setWidth(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AppIcons.backButton),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "${"code_has_sent".tr()}${widget.controller}",
                      style: AppTextStyle.medium(),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(30),
                        bottom: ScreenUtil().setHeight(30),
                      ),
                      child: _codeTextField(),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "receiveing_time".tr(),
                            style:
                                AppTextStyle.regular(color: AppColors.blackV),
                          ),
                          TextSpan(
                            text: " 00:57",
                            style: AppTextStyle.regular(
                              color: AppColors.activeColorOfPin,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ScreenUtil().setVerticalSpacing(20),
                    context.watch<AuthCubit>().isSmsCode == IsSmsCode.incorrect
                        ? Text(
                            "incorrect_code".tr(),
                            style: AppTextStyle.medium(color: AppColors.red),
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: ScreenUtil().setHeight(220),
                    ),
                    AppBlueButton1(
                      primary: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.splashColor1,
                          AppColors.splashColor2,
                        ],
                      ),
                      onPressed: () async {
                        context.read<AuthCubit>().fetchSmsCode().then((value) {
                          if (context.read<AuthCubit>().isSmsCode ==
                              IsSmsCode.correct) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavBarView(),
                                ));
                          }
                        });
                      },
                      child: Text(
                        "input_and_enter".tr(),
                        style: AppTextStyle.regular(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PinCodeTextField _codeTextField() => PinCodeTextField(
        enableActiveFill: true,
        enablePinAutofill: true,
        cursorColor: AppColors.blackV,
        appContext: context,
        controller: context.read<AuthCubit>().smsController,
        length: 4,
        keyboardType: TextInputType.number,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        pinTheme: PinTheme(
          borderWidth: 0.5,
          selectedColor: AppColors.activeColorOfPin,
          selectedFillColor: AppColors.colorOfPinCode,
          fieldHeight: ScreenUtil().setHeight(56),
          fieldWidth: ScreenUtil().setWidth(72),
          activeFillColor: AppColors.colorOfPinCode,
          disabledColor: AppColors.colorOfButtonGrey,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(10.0),
          ),
          shape: PinCodeFieldShape.box,
          activeColor: AppColors.colorOfButtonGrey,
          inactiveColor: AppColors.colorOfButtonGrey,
          errorBorderColor: AppColors.errorColor,
          inactiveFillColor: AppColors.colorOfPinCode,
        ),
        onChanged: (v) {},
      );
}
