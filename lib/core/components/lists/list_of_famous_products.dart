import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/shimmer_widget.dart';
import 'package:ponygold/data/models/single_product_model.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';
import 'package:ponygold/screens/home/info_about_product.dart';

import '../../../logic/service_cubit/popular_product_cubit/single_product_info_cubit.dart';
import '../../constant/app_icons.dart';

class ListOfFamousProducts extends StatefulWidget {
  const ListOfFamousProducts({super.key});

  @override
  State<ListOfFamousProducts> createState() => _ListOfFamousProductsState();
}

class _ListOfFamousProductsState extends State<ListOfFamousProducts> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleProductInfoCubit, SingleProductInfoState>(
      builder: (context, state) {
        final valuewatch = context.watch<CaruselchangeCubit>();
        final valueread = context.read<CaruselchangeCubit>();
        if (state is SingleProductInfoLoaded) {
          final singleProList = state.productModel;
          return Container(
            height: ScreenUtil().setHeight(206),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: singleProList.length,
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildProduct(
                    valueread, singleProList, itemIndex, valuewatch);
              },
            ),
          );
        } else if (state is SingleProductInfoLoading) {
          return _buildShimmer();
        }

        return Container();
      },
    );
  }

  Container _buildShimmer() {
    return Container(
      height: ScreenUtil().setHeight(206),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: ShimmerWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                    ),
                    height: ScreenUtil().setWidth(120.0),
                    width: ScreenUtil().setWidth(120.0),
                  ),
                  ScreenUtil().setVerticalSpacing(10),
                  Container(
                    height: ScreenUtil().setHeight(36),
                    width: ScreenUtil().setWidth(120),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  ScreenUtil().setVerticalSpacing(5),
                  Container(
                    height: ScreenUtil().setHeight(16),
                    width: ScreenUtil().setWidth(78.0),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  ScreenUtil().setVerticalSpacing(2),
                  Container(
                    height: ScreenUtil().setHeight(19),
                    width: ScreenUtil().setWidth(120.0),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildProduct(
      CaruselchangeCubit valueread,
      List<SingleProductData> singleProList,
      int itemIndex,
      
      CaruselchangeCubit valuewatch) {
    return Container(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            height: ScreenUtil().setWidth(120.0),
            width: ScreenUtil().setWidth(120.0),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                      decoration: BoxDecoration(
                        // color: AppColors.red,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      height: ScreenUtil().setHeight(120.0),
                      width: ScreenUtil().setWidth(120),
                      child: PageView.builder(
                          onPageChanged: (int index) {
                            valueread.changePageView(index);
                          },
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: singleProList[itemIndex].photos!.length,
                          itemBuilder: (context, builderindex) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoAboutSimplePro(
                                      data: singleProList,
                                      dataIndex: itemIndex,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: ScreenUtil().setHeight(120),
                                width: ScreenUtil().setWidth(120),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Image.network(
                                  singleProList[itemIndex]
                                      .photos![builderindex]
                                      .url
                                      .toString(),
                                ),
                              ),
                            );
                          })),
                ),
                ValueListenableBuilder(
                  valueListenable: Hive.box<int>('favorites').listenable(),
                  builder: (context, Box box, child) => Positioned(
                    top: ScreenUtil().setHeight(4.0),
                    right: ScreenUtil().setWidth(4.0),
                    child: GestureDetector(
                      onTap: () {
                        if (box.containsKey(singleProList[itemIndex].id)) {
                          box.delete(singleProList[itemIndex].id);
                          print('deleted');
                          return;
                        }
                        print('added');
                        box.put(singleProList[itemIndex].id,
                            singleProList[itemIndex].id);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 20.r,
                        child: !box.containsKey(singleProList[itemIndex].id)
                            ? SvgPicture.asset(
                                AppIcons.vector,
                                color: AppColors.colorOfButtonGrey,
                                height: 18.h,
                              )
                            : SvgPicture.asset(
                                AppIcons.favorite,
                                color: AppColors.activeColorOfPin,
                              ),
                      ),
                    ),
                  ),
                ),
                
                Positioned(
                  left: ScreenUtil().setWidth(43),
                  bottom: 4.h,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: ScreenUtil().setHeight(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5.r,
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(1.0),
                        ),
                        child: Row(
                          children: [
                            ...List.generate(
                              singleProList[itemIndex].photos!.length,
                              (index) => CircleAvatar(
                                radius: 6.71.r,
                                backgroundColor: valuewatch.pageIndex == index
                                    ? AppColors.activeColorOfPin
                                    : AppColors.colorOfButtonGrey,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(120.0),
                  child: Text(
                    singleProList[itemIndex].name!,
                    style: AppTextStyle.medium(size: 15),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5.0),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(120),
                  child: Text(
                    singleProList[itemIndex].price!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(120),
                  child: Text(
                    singleProList[itemIndex].price!,
                    style:
                        AppTextStyle.medium(color: AppColors.blackV, size: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
Container(
            height: ScreenUtil().setHeight(206),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: singleProList.length,
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildProduct(
                    valueread, singleProList, itemIndex, valuewatch);
              },
            ),
          );
 */