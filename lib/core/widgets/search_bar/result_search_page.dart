import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/core/widgets/small_buttons/close_button.dart';
import 'package:ponygold/core/widgets/small_buttons/small_button.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

class ResultSearchPage extends StatefulWidget {
  const ResultSearchPage({super.key, required this.query});
  final String query;

  @override
  State<ResultSearchPage> createState() => _ResultSearchPageState();
}

class _ResultSearchPageState extends State<ResultSearchPage> {
  @override
  Widget build(BuildContext context) {
    final value = context.read<CaruselchangeCubit>();
    bool isChecked = false;
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(8.0),
              bottom: ScreenUtil().setHeight(5.0),
              right: ScreenUtil().setWidth(5.0),
            ),
            width: ScreenUtil().setWidth(295),
            child: TextFormField(
              cursorColor: AppColors.colorOfButtonGrey,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: AppColors.colorOfButtonGrey,
                  ),
                ),
                fillColor: AppColors.colorOfTextform,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    // showSearch(
                    //     context: context, delegate: CustomSearchDelegate());
                  },
                  icon: const Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.only(
                  left: 10.w,
                  top: 4.h,
                ),
                hintText: widget.query.toString(),
                labelStyle: AppTextStyle.regular(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10.0),
          left: ScreenUtil().setWidth(10.0),
          right: ScreenUtil().setWidth(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialogforFilter(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          "popular".tr(),
                          style: AppTextStyle.mediumSmall(),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5.0),
                        ),
                        SvgPicture.asset(
                          AppIcons.down,
                          color: AppColors.blackV,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      insideOfFilter(context, isChecked);
                    },
                    child: Row(
                      children: [
                        Text(
                          "filtr".tr(),
                          style: AppTextStyle.mediumSmall(),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5),
                        ),
                        SvgPicture.asset(
                          AppIcons.filter,
                          color: AppColors.blackV,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(20.0),
                          left: ScreenUtil().setWidth(15.0),
                          right: ScreenUtil().setWidth(15.0),
                        ),
                        child: Expanded(
                          // width: ScreenUtil().setWidth(328),
                          // flex: 4,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // maxCrossAxisExtent: ScreenUtil().setWidth(288.0),
                                mainAxisExtent: ScreenUtil().setHeight(300.0),
                                childAspectRatio: 4 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount: 6,
                            itemBuilder: (BuildContext ctx, index) {
                              return SizedBox(
                                height: ScreenUtil().setHeight(150),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //          InfoAboutSimplePro(
                                        //           data: [],
                                        //           index: index,
                                        //          ),
                                        //   ),
                                        // );
                                      },
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //          InfoAboutSimplePro(
                                                //           data: [],
                                                //           index : index,
                                                //         ),
                                                //   ),
                                                // );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      image: NetworkImage(
                                                        "https://media.istockphoto.com/photos/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-picture-id1303978937?b=1&k=20&m=1303978937&s=170667a&w=0&h=az5Y96agxAdHt3XAv7PP9pThdiDpcQ3otWWn9YuJQRc=",
                                                      ),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: AppColors.white,
                                                ),
                                                height: ScreenUtil()
                                                    .setHeight(150.0),
                                                width: ScreenUtil()
                                                    .setWidth(300.0),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: ScreenUtil()
                                                          .setHeight(4.0),
                                                      right: ScreenUtil()
                                                          .setWidth(4.0),
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              AppColors.white,
                                                          radius: 20.r,
                                                          child:
                                                              SvgPicture.asset(
                                                            AppIcons.vector,
                                                            color: AppColors
                                                                .colorOfButtonGrey,
                                                            height: 18.h,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: ScreenUtil()
                                                          .setWidth(53),
                                                      bottom: 4.h,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        width: ScreenUtil()
                                                            .setWidth(44),
                                                        height: ScreenUtil()
                                                            .setHeight(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5.r,
                                                          ),
                                                          color: Colors.white,
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                ScreenUtil()
                                                                    .setHeight(
                                                                        1.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 6.71.r,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .activeColorOfPin,
                                                              ),
                                                              CircleAvatar(
                                                                radius: 6.71.r,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .colorOfButtonGrey,
                                                              ),
                                                              CircleAvatar(
                                                                radius: 6.71.r,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .colorOfButtonGrey,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 5.h,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: ScreenUtil()
                                                        .setHeight(10.0),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenUtil()
                                                        .setWidth(120.0),
                                                    child: Text(
                                                      "Лоферы Ralf \nRinger женские",
                                                      style:
                                                          AppTextStyle.medium(),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil()
                                                        .setHeight(8.0),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenUtil()
                                                        .setWidth(120),
                                                    child: Text(
                                                      "2 300 000 ${"sum".tr()}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.h,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenUtil()
                                                        .setWidth(120),
                                                    child: Text(
                                                      "2 300 000 ${"sum".tr()}",
                                                      style:
                                                          AppTextStyle.medium(
                                                        color: AppColors.blackV,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> showDialogforFilter(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // title: const Text('AlertDialog Title'),
        // content: const Text('AlertDialog description'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(18),
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
              bottom: 18.h,
            ),
            height: ScreenUtil().setHeight(190),
            width: ScreenUtil().setWidth(260),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "all_results".tr(),
                      style: AppTextStyle.mediumSmall(),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      height: 16.h,
                      width: 16.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.colorOfgrey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> insideOfFilter(BuildContext context, bool isChecked) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 610.h,
          color: AppColors.mainBackgroundColor,
          child: Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10.0),
              // left: ScreenUtil().setWidth(10.0),
              // right: ScreenUtil().setWidth(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 135.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "filter".tr(),
                        style: AppTextStyle.mediumSmall(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "close".tr(),
                          style: AppTextStyle.regular(
                            color: AppColors.activeColorOfPin,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(160),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "all_category".tr(),
                                  style: AppTextStyle.regular(
                                    color: AppColors.blackV,
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(10),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                  ),
                                  height: 16.h,
                                  width: 16.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: AppColors.colorOfgrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(20.0),
                    left: 15.w,
                    bottom: 20.h,
                  ),
                  child: Text(
                    "price".tr() + ("sum".tr()),
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.blackV,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(40.0),
                        width: ScreenUtil().setWidth(147),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(5.0),
                              top: ScreenUtil().setHeight(9),
                            ),
                            hintText: "от 0 ",
                            hintStyle: AppTextStyle.mediumSmall(
                              color: AppColors.blackV,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(20.0),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(40.0),
                        width: ScreenUtil().setWidth(147),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(5.0),
                              top: ScreenUtil().setHeight(9),
                            ),
                            hintText: "до 0",
                            hintStyle: AppTextStyle.mediumSmall(
                              color: AppColors.blackV,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 20.h,
                    bottom: 8.h,
                  ),
                  child: Text(
                    "brends".tr(),
                    style: AppTextStyle.mediumSmall(
                      color: AppColors.blackV,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(45),
                    width: ScreenUtil().setWidth(328),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(5.0),
                          top: ScreenUtil().setHeight(9),
                        ),
                        hintText: 'search'.tr(),
                        hintStyle: AppTextStyle.regular(
                          color: AppColors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(17),
                    left: ScreenUtil().setWidth(15),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 74.h,
                                color: AppColors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    // horizontal: 15.w,
                                    vertical: 10.h,
                                  ),
                                  child: Row(
                                    children: [
                                      SmallButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: AppTextStyle.mediumSmall(
                                          color: AppColors.activeColorOfPin,
                                        ),
                                        label: "clear".tr(),
                                      ),
                                      CloseButtons(
                                        primary: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            AppColors.splashColor1,
                                            AppColors.splashColor2,
                                          ],
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: AppTextStyle.regular(
                                          color: AppColors.white,
                                        ),
                                        label: "close".tr(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(24),
                          width: ScreenUtil().setWidth(24),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        "Aimoto",
                        style: AppTextStyle.regular(
                          color: AppColors.blackV,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(17),
                    left: ScreenUtil().setWidth(15),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 74.h,
                                color: AppColors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 10.h,
                                  ),
                                  child: AppBlueButton1(
                                    primary: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.splashColor1,
                                        AppColors.splashColor2,
                                      ],
                                    ),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const SubCategoryPage(),
                                      //   ),
                                      // );
                                    },
                                    child: Text(
                                      "Показать результаты",
                                      style: AppTextStyle.regular(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(24),
                          width: ScreenUtil().setWidth(24),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        "Mega technical company",
                        style: AppTextStyle.regular(
                          color: AppColors.blackV,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
