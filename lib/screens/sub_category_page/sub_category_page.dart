import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_page.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/screens/sub_category_page/sub_category_product_page.dart';

import '../../../core/constant/app_colors.dart';

class SubCategoryPage extends StatefulWidget {
  final CategoryData categoryData;
  const SubCategoryPage({super.key, required this.categoryData});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const MainAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenUtil().setVerticalSpacing(24),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
            child: Text(
              widget.categoryData.name!,
              style: AppTextStyle.regular1(
                size: 18,
                color: AppColors.blackV,
              ),
            ),
          ),
          ScreenUtil().setVerticalSpacing(16),
          const Divider(
            color: AppColors.grey,
            thickness: 0.1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.categoryData.subCategories!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final subCategory = widget.categoryData.subCategories![index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubcategoryProductPage(
                                  subCategories: subCategory,
                                  categoryName: widget.categoryData.name!)),
                        );
                      },
                      title: Text(
                        subCategory.name!,
                        style: AppTextStyle.mediumSmall(
                          size: 14,
                          color: AppColors.blackV,
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        AppIcons.forwardarrow,
                        color: AppColors.grey,
                      ),
                    ),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.1,
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
}
