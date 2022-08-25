import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_page.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/drawer/drawer_page.dart';
import 'package:ponygold/data/models/basket_hive_model/basket_hive_model.dart';
import 'package:ponygold/logic/service_cubit/fetchcategorycubit/fetch_category_data_cubit.dart';
import 'package:ponygold/logic/uicubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

import '../../../logic/service_cubit/brand_cubit/brand_cubit.dart';
import '../../../logic/service_cubit/get_banners_cubit/get_banners_cubit.dart';
import '../../../logic/service_cubit/popular_product_cubit/single_product_info_cubit.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  void initState() {
    context.read<SingleProductInfoCubit>().fetchSingleProductInfo(context);
    context.read<GetBannersCubit>().fetchSingleProductInfo();
    context.read<BrandCubit>().fetchBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCategoryDataCubit()..fetchCategoryData(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final valueContext = context.read<BottomNavBarCubit>();
          bool showFab = MediaQuery.of(context).viewInsets.bottom != 0.0;
          return Scaffold(
            drawer: const FirstDrawerPage(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: valueContext.pageIndex == 0
                  ? const MainAppBar()
                  : AppBarForShop(
                      title: valueContext.pageIndex == 1
                          ? "shop_basket".tr()
                          : valueContext.pageIndex == 2
                              ? "favorites".tr()
                              : valueContext.pageIndex == 3
                                  ? "profile".tr()
                                  : "bonus_pony_gold".tr(),
                    ),
            ),
            body: valueContext.pages[valueContext.pageIndex],
            floatingActionButton: Visibility(
              visible: !showFab,
              child: Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(10.0),
                  top: ScreenUtil().setHeight(45.0),
                ),
                height: 80.h,
                width: 80.h,
                child: FloatingActionButton(
                  splashColor: AppColors.white,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  hoverElevation: 0,
                  highlightElevation: 0,
                  onPressed: () {
                    valueContext.changePages(4);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bonus.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100.0),
                    width: ScreenUtil().setWidth(100.0),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              // notchMargin: 10.0,
              child: Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15),
                ),
                width: ScreenUtil().setWidth(double.infinity),
                height: ScreenUtil().setHeight(60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        valueContext.changePages(0);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ScreenUtil().setWidth(50.0),
                        height: ScreenUtil().setHeight(45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (SvgPicture.asset(
                              AppIcons.home,
                              color: valueContext.pageIndex == 0
                                  ? AppColors.activeColorOfPin
                                  : AppColors.colorOfButtonGrey,
                            )),
                            SizedBox(
                              height: ScreenUtil().setHeight(2),
                            ),
                            Text(
                              "main".tr(),
                              style: AppTextStyle.regular4(
                                color: valueContext.pageIndex == 0
                                    ? AppColors.activeColorOfPin
                                    : AppColors.colorOfButtonGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          Hive.box<BasketHiveModel>('basketBox').listenable(),
                      builder: ((context, Box box, child) {
                        return GestureDetector(
                          onTap: () {
                            valueContext.changePages(1);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(10.0),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: ScreenUtil().setWidth(50.0),
                              height: ScreenUtil().setHeight(45),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Column(
                                      children: [
                                        (SvgPicture.asset(
                                          AppIcons.shoppingcard,
                                          color: valueContext.pageIndex == 1
                                              ? AppColors.activeColorOfPin
                                              : AppColors.colorOfButtonGrey,
                                        )),
                                        Text(
                                          "shop_basket".tr(),
                                          style: AppTextStyle.regular4(
                                            color: valueContext.pageIndex == 1
                                                ? AppColors.activeColorOfPin
                                                : AppColors.colorOfButtonGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  box.isNotEmpty
                                      ? Positioned(
                                          right: ScreenUtil().setWidth(10.0),
                                          child: CircleAvatar(
                                            radius: 6.r,
                                            backgroundColor:
                                                AppColors.activeColorOfPin,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(8.0),
                        left: ScreenUtil().setWidth(50),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          valueContext.changePages(2);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().setWidth(64.0),
                          height: ScreenUtil().setHeight(43.0),
                          child: Column(
                            children: [
                              (SvgPicture.asset(AppIcons.vector,
                                  height: 18.h,
                                  color: valueContext.pageIndex == 2
                                      ? AppColors.activeColorOfPin
                                      : AppColors.colorOfButtonGrey)),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(2),
                                      ),
                                      
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                                child: Text(
                                  "favorites".tr(),
                                  style: AppTextStyle.regular4(
                                    color: valueContext.pageIndex == 2
                                        ? AppColors.activeColorOfPin
                                        : AppColors.colorOfButtonGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        valueContext.changePages(3);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: ScreenUtil().setWidth(52.0),
                        height: ScreenUtil().setHeight(44.0),
                        child: Column(
                          children: [
                            (SvgPicture.asset(
                              AppIcons.user2,
                              height: ScreenUtil().setWidth(24.0),
                              width: ScreenUtil().setWidth(24),
                              color: valueContext.pageIndex == 3
                                  ? AppColors.activeColorOfPin
                                  : AppColors.colorOfButtonGrey,
                            )),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                              child: Text(
                                "profile".tr(),
                                style: AppTextStyle.regular4(
                                  color: valueContext.pageIndex == 3
                                      ? AppColors.activeColorOfPin
                                      : AppColors.colorOfButtonGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
