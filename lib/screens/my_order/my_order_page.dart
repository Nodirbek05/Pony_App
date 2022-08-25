import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/logic/service_cubit/my_order_cubit/my_order_cubit.dart';
import 'package:ponygold/logic/uicubit/my_orders_cubit/my_orders_page_cubit.dart';

import 'active_orders.dart';
import 'deactive_orders.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  void initState() {
    context.read<MyOrderCubit>().fetchMyOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersPageCubit, MyOrdersPageState>(
      builder: (context, state) {
        final value = context.read<MyOrdersPageCubit>();
        return Scaffold(
          backgroundColor: AppColors.mainBackgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: AppBarForShop(
              title: "my_orders".tr(),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                  left: 18.w,
                  right: 15.w,
                  bottom: 10.h,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.changeOrderPage(0);
                      },
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "active_order".tr(),
                              style: AppTextStyle.medium(
                                color: value.orderPage == 0
                                    ? AppColors.activeColorOfPin
                                    : AppColors.blackV,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              width: ScreenUtil().setWidth(156),
                              height: ScreenUtil().setHeight(1),
                              color: value.orderPage == 0
                                  ? AppColors.activeColorOfPin
                                  : AppColors.dividerColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.changeOrderPage(1);
                      },
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "finished_order".tr(),
                              style: AppTextStyle.medium(
                                color: value.orderPage == 1
                                    ? AppColors.activeColorOfPin
                                    : AppColors.blackV,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              width: ScreenUtil().setWidth(156),
                              height: ScreenUtil().setHeight(1),
                              color: value.orderPage == 1
                                  ? AppColors.activeColorOfPin
                                  : AppColors.dividerColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<MyOrderCubit, MyOrderState>(
                  builder: (context, state) {
                    if (state is MyOrderLoaded) {
                      print('Active order ---------${state.activeOrder}');
                      print('Finished order ---------${state.finishedOrder}');

                      return Column(
                        children: [
                          value.orderPage == 0
                              ? ActiveOrders(activeOrder: state.activeOrder)
                              : DeActiveOrders(
                                  finishedOrder: state.finishedOrder),
                        ],
                      );
                    } else if (state is MyOrderFailure) {
                      return const SizedBox();
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
