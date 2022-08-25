import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.subProduct,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final dynamic subProduct;
  final PageController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
              ),
              height: ScreenUtil().setHeight(150.0),
              width: ScreenUtil().setWidth(300.0),
              child: PageView.builder(
                onPageChanged: (value) {
                  context.read<CaruselchangeCubit>().imageChange(index, value);
                },
                itemCount: subProduct.photos!.length,
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemBuilder: (context, imageIndex) {
                  return Image.network(subProduct.photos![imageIndex].url!);
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box<int>('favorites').listenable(),
              builder: (context, Box box, child) => Positioned(
                top: ScreenUtil().setHeight(4.0),
                right: ScreenUtil().setWidth(4.0),
                child: GestureDetector(
                  onTap: () {
                    if (box.containsKey(subProduct.id)) {
                      box.delete(subProduct.id);
                      print('deleted');
                      return;
                    }
                    print('added');
                    box.put(subProduct.id, subProduct.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 20.r,
                    child: !box.containsKey(subProduct.id)
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
              left: ScreenUtil().setWidth(55),
              bottom: 4.h,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: ScreenUtil().setWidth(44),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      subProduct.photos!.length,
                      (ind) => CircleAvatar(
                        radius: 6.71.r,
                        backgroundColor: context
                                    .watch<CaruselchangeCubit>()
                                    .dynamicListIndex[index] !=
                                ind
                            ? AppColors.grey
                            : AppColors.activeColorOfPin,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                  subProduct.name!,
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
                  subProduct.price!,
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
                  subProduct.price!,
                  style: AppTextStyle.medium(color: AppColors.blackV, size: 15),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
