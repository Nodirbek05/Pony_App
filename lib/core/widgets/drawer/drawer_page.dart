import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/drawer/second_drawer_page.dart';

class FirstDrawerPage extends StatefulWidget {
  const FirstDrawerPage({super.key});

  @override
  State<FirstDrawerPage> createState() => _FirstDrawerPageState();
}

class _FirstDrawerPageState extends State<FirstDrawerPage> {
  // @override
  // void initState() {
  //   context.read<FetchCategoryDataCubit>().fetchCategoryData();
  //   super.initState();
  // }

  // int indexDrawer = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ScreenUtil().setWidth(304),
      child: Scaffold(
          backgroundColor: AppColors.mainBackgroundColor,
          drawer: const SecondDrawerPage(),
          body: SizedBox(
            width: ScreenUtil().setWidth(304),
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(222),
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: AppColors.drawePageColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 15.h,
                              ),
                              height: 55.h,
                              width: 328.w,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/rectangle.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10.h,
                                    left: 18.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                           "receive_bonus".tr(),
                                          style: AppTextStyle.regular2(
                                            color: AppColors.white,
                                          ),
                                        ),
                                        Text(
                                          "1 000 000${"sum".tr()}",
                                          style: AppTextStyle.mediumBig(
                                            size: 16.h,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 150.w,
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.r),
                                        ),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/coins.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.w,
                                    top: 20.h,
                                    child: SvgPicture.asset(
                                      AppIcons.forwardarrow,
                                      color: AppColors.white,
                                      height: 14.h,
                                      width: 14.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: ScreenUtil().setWidth(30),
                                    backgroundImage: const NetworkImage(
                                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: AppColors.white,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          "enter_your_account".tr(),
                                          style: AppTextStyle.medium(
                                            color: AppColors.blackV,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: ScreenUtil().setHeight(15.0),
                                          color: AppColors.blackV,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.qr_2,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              tr("category"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.qr_1,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              tr("brends"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.qr_1,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                             tr("payment_place"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.coin,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              tr("how_to_receive_bonus"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.handbag,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                             tr("my_orders"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.handbag,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              tr("help_in_buying"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.conversation,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              tr( "help_in_buying"),
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: SvgPicture.asset(
                              AppIcons.phone,
                              color: AppColors.colorOfButtonGrey,
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                            ),
                            title: Text(
                              "Call Center +998 908 99 99",
                              style: AppTextStyle.regular1(
                                color: AppColors.blackV,
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
