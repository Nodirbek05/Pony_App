import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/logic/uicubit/database_cubit/database_cubit.dart';
import 'package:ponygold/screens/shop/shop_with_items.dart';

import '../../data/models/basket_hive_model/basket_hive_model.dart';
import 'empty_shop_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final Box favoritebox = Hive.box<BasketHiveModel>('basketBox');
  @override
  void initState() {
    context.read<DatabaseCubit>().getBasketCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        body: ValueListenableBuilder(
          valueListenable: favoritebox.listenable(),
          builder: (context, Box box, child) =>
              BlocBuilder<DatabaseCubit, DatabaseState>(
            builder: (_, state) {
              final value = _.watch<DatabaseCubit>().databaseBaskets;
              print('Database --------------- $value');
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 20.h,
                ),
                child:
                    box.isEmpty ? const EmptyShopPage() : const ShopWithItems(),
              );
            },
          ),
        ));
  }
}
