import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/screens/sub_category_page/sub_category_product_page.dart';

class ThirdDrawerPage extends StatelessWidget {
  const ThirdDrawerPage(
      {super.key, required this.data, required this.categoryName});
  final String categoryName;
  final List<SubCategories> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      // appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(120),
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(60),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[100],
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      SizedBox(
                        width: ScreenUtil().setWidth(6),
                      ),
                      Text(tr("back"), style: AppTextStyle.medium()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SvgPicture.asset(
                      AppIcons.laptop,
                    ),
                    title: Text(data[index].name.toString()),
                    trailing: SvgPicture.asset(
                      AppIcons.forwardarrow,
                      color: AppColors.colorOfButtonGrey,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubcategoryProductPage(
                                  subCategories: data[index],
                                  categoryName: categoryName)));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
