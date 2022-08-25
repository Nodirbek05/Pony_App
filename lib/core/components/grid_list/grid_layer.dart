import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';

import '../../../logic/service_cubit/brand_cubit/brand_cubit.dart';

class GridLayer extends StatelessWidget {
  const GridLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if (state is BrandLoaded) {
          return _buildBrands(state);
        } else if (state is BrandLoading) {
          return _buildShimmer();
        }
        return const SizedBox();
      },
    );
  }

  _buildShimmer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 2,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            alignment: Alignment.center,
          );
        },
      ),
    );
  }

  Container _buildBrands(BrandLoaded state) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: state.brandData.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            alignment: Alignment.center,
            child: Image.network(
              state.brandData[index].image!,
              height: ScreenUtil().setHeight(62),
              width: ScreenUtil().setWidth(88),
            ),
          );
        },
      ),
    );
  }
}
