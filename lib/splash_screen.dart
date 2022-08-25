import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/nav_bar_buttom/nav_bar_page.dart';
import 'package:ponygold/screens/auth/language_and_number/choose_language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box storageId = Hive.box<int>('userId');
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (storageId.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LanguagePage()),
        );
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBarView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.splashColor1,
              AppColors.splashColor2,
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/pony_gold.png',
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              SizedBox(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.white,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
