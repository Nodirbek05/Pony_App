import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_page.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/drawer/drawer_page.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

import '../../core/widgets/product_widget.dart';

class SubcategoryProductPage extends StatefulWidget {
  final String categoryName;
  final SubCategories subCategories;
  const SubcategoryProductPage(
      {super.key, required this.subCategories, required this.categoryName});

  @override
  State<SubcategoryProductPage> createState() => _SubCategoryProductPageState();
}

class _SubCategoryProductPageState extends State<SubcategoryProductPage> {
  final PageController controller = PageController();

  @override
  void initState() {
    context
        .read<CaruselchangeCubit>()
        .getLength(widget.subCategories.products!.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const MainAppBar(),
      ),
      drawer: const FirstDrawerPage(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.h,
          left: ScreenUtil().setWidth(15),
          right: ScreenUtil().setWidth(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.categoryName,
                    style: AppTextStyle.medium(
                      size: 12,
                      color: AppColors.activeColorOfPin,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset(
                    AppIcons.forwardarrow,
                    color: AppColors.activeColorOfPin,
                    height: 8.h,
                  ),
                ],
              ),
            ),
            ScreenUtil().setVerticalSpacing(10),
            Text(
              widget.subCategories.name!,
              style: AppTextStyle.semiBold(
                size: 18,
                color: AppColors.blackV,
              ),
            ),
            ScreenUtil().setVerticalSpacing(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // showDialogforFilter(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        tr("Популярные"),
                        style: AppTextStyle.mediumSmall(),
                      ),
                      ScreenUtil().setHorizontalSpacing(4),
                      SvgPicture.asset(
                        AppIcons.down,
                        color: AppColors.blackV,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // insideOfFilter(context, isChecked);
                  },
                  child: Row(
                    children: [
                      Text(
                        tr("Фильтры"),
                        style: AppTextStyle.mediumSmall(),
                      ),
                      ScreenUtil().setHorizontalSpacing(5),
                      SvgPicture.asset(
                        AppIcons.filter,
                        color: AppColors.blackV,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ScreenUtil().setVerticalSpacing(16),
            Expanded(
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
                itemCount: widget.subCategories.products!.length,
                itemBuilder: (BuildContext ctx, index) {
                  final subProduct = widget.subCategories.products![index];
                  return ProductWidget(
                    subProduct: subProduct,
                    controller: controller,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
