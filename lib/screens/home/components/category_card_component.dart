import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/widgets/shimmer_widget.dart';
import 'package:ponygold/data/models/category_model.dart';
import 'package:ponygold/logic/service_cubit/fetchcategorycubit/fetch_category_data_cubit.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_text_style.dart';
import '../../sub_category_page/sub_category_page.dart';

class CategoryCardComponent extends StatelessWidget {
  const CategoryCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryDataCubit, FetchCategoryDataState>(
      builder: (context, state) {
        if (state is FetchCategoryDataLoaded) {
          return Container(
            padding: EdgeInsets.only(left: 15.w),
            height: ScreenUtil().setHeight(60.0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.categoryList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) =>
                  _buildCategoryCard(context, state.categoryList[index]),
            ),
          );
        } else if (state is FetchCategoryDataLoading) {
          return Container(
            padding: EdgeInsets.only(left: 15.w),
            height: ScreenUtil().setHeight(60.0),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => _buildShimmer()),
          );
        }
        return const Center(child: Text('No DATA'));
      },
    );
  }

  _buildCategoryCard(BuildContext context, CategoryData category) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(14)),
      child: Ink(
        width: ScreenUtil().setWidth(218),
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: AppColors.white),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubCategoryPage(categoryData: category)));
          },
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(category.photo ??
                          'https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1201&q=80'),
                      fit: BoxFit.cover),
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                ),
                height: ScreenUtil().setHeight(65.0),
                width: ScreenUtil().setWidth(56.0),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 220,
                child: Text(
                  category.name!,
                  style: AppTextStyle.medium(size: 15),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ShimmerWidget _buildShimmer() {
    return ShimmerWidget(
        child: Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(14)),
      child: Container(
        width: ScreenUtil().setWidth(218),
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: AppColors.white),
      ),
    ));
  }
}
