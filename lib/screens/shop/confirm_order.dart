import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:ponygold/core/widgets/drawer/drawer_page.dart';
import 'package:ponygold/core/widgets/payment_container/payment_container_page.dart';
import 'package:ponygold/logic/service_cubit/order_cubit/order_product_cubit.dart';
import 'package:ponygold/logic/uicubit/choosing_payment_cubit/choosing_payment_part_cubit.dart';
import 'package:ponygold/screens/map/map_page.dart';
import 'package:ponygold/screens/my_order/my_order_page.dart';

import '../../../core/constant/app_icons.dart';
import '../../data/models/basket_hive_model/basket_hive_model.dart';

class ConfirmOrderPage extends StatefulWidget {
  final List<BasketHiveModel> dataBaseBasket;
  final String sum;
  const ConfirmOrderPage(
      {super.key, required this.dataBaseBasket, required this.sum});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      drawer: const FirstDrawerPage(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBarForShop(
          title: "confirm_order".tr(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(72),
                        width: ScreenUtil().setWidth(328),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15),
                            top: ScreenUtil().setWidth(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "address".tr(),
                                    style: AppTextStyle.mediumSmall(
                                        color: AppColors.blackV),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(5),
                                  ),
                                  Text(
                                    "order_address".tr(),
                                    style: AppTextStyle.regular(
                                        color: AppColors.colorOfgrey),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(15),
                                  bottom: ScreenUtil().setHeight(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MapPage(),
                                      ),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    AppIcons.settings,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      const PaymentCardPage(),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      ..._builtOrderProducts()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: ScreenUtil().setHeight(74),
                width: ScreenUtil().setWidth(328),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  child: AppBlueButton1(
                    onPressed: () async {
                      await _orderProduct(
                          context, context.read<OrderProductCubit>());
                    },
                    primary: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.splashColor1,
                        AppColors.splashColor2,
                      ],
                    ),
                    child: BlocBuilder<OrderProductCubit, OrderProductState>(
                      builder: (context, state) {
                        if (state is OrderProductLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.white),
                          );
                        }
                        return Text(
                          "confirm_order".tr(),
                          style: AppTextStyle.regular1(color: AppColors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _orderProduct(
      BuildContext context, OrderProductCubit orderCubit) async {
    final payment = context.read<ChoosingPaymentPartCubit>().paymentType;
    final String cashType = payment == 0
        ? "Наличными"
        : payment == 1
            ? "Payme"
            : "Pony";
    await orderCubit
        .fetchOrder("Доставка", widget.sum, cashType, widget.dataBaseBasket)
        .then((value) => doneOrder(context));
  }

  List<Widget> _builtOrderProducts() {
    return List.generate(
        widget.dataBaseBasket.length,
        (index) => Container(
              width: ScreenUtil().setWidth(328),
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(15),
                  vertical: ScreenUtil().setHeight(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(153),
                        child: Text(
                          widget.dataBaseBasket[index].name,
                          style: AppTextStyle.regular(
                              size: 14, color: AppColors.blackV),
                        ),
                      ),
                      const Spacer(),
                      RichText(
                          text: TextSpan(
                              text: 'x${widget.dataBaseBasket[index].count}, ',
                              style: AppTextStyle.regular(
                                  size: 14, color: AppColors.pinkColor),
                              children: [
                            TextSpan(
                              text: widget.dataBaseBasket[index].price,
                              style: AppTextStyle.regular(
                                  size: 14, color: AppColors.blackV),
                            )
                          ]))
                    ],
                  ),
                  ScreenUtil().setVerticalSpacing(2),
                  Row(
                    children: [
                      Text(
                        '${'size'.tr()}: ${widget.dataBaseBasket[index].size}',
                        style: AppTextStyle.medium(
                            size: 12, color: AppColors.grey),
                      ),
                      ScreenUtil().setHorizontalSpacing(14),
                      RichText(
                          text: TextSpan(
                              text: 'color'.tr(),
                              style: AppTextStyle.medium(
                                  size: 12, color: AppColors.grey),
                              children: [
                            TextSpan(
                              text: ': ${widget.dataBaseBasket[index].color}',
                              style: AppTextStyle.regular(
                                  size: 12, color: AppColors.blackV),
                            )
                          ]))
                    ],
                  )
                ],
              ),
            ));
  }

  // Future<dynamic> showModalOnAlways(BuildContext context) {
  //   return showModalBottomSheet(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(20),
  //         topRight: Radius.circular(20),
  //       ),
  //     ),
  //     context: context,
  //     builder: (context) {
  //       return

  //     },
  //   );
  // }

  Future<void> doneOrder(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 456.h,
          color: AppColors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 80.h,
                ),
                child: SizedBox(
                  width: ScreenUtil().setWidth(328),
                  child: Text(
                    "your_order_confirm".tr(),
                    style: AppTextStyle.medium(
                      color: AppColors.blackV,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(328),
                child: Text(
                  "contact_to_manager".tr(),
                  style: AppTextStyle.regular(
                    color: AppColors.blackV,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              AppBlueButton1(
                primary: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.splashColor1,
                    AppColors.splashColor2,
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyOrderPage(),
                    ),
                  );
                },
                child: Text(
                  "my_orders".tr(),
                  style: AppTextStyle.regular(
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              SvgPicture.asset(
                AppIcons.done2,
                height: ScreenUtil().setHeight(90),
                color: AppColors.activeColorOfPin,
              ),
            ],
          ),
        );
      },
    );
  }
}
