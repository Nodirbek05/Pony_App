import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ponygold/logic/service_cubit/add_favorite_cubit/favorite_cubit.dart';
import 'package:ponygold/logic/service_cubit/auth_cubit/auth_cubit.dart';
import 'package:ponygold/logic/service_cubit/get_banners_cubit/get_banners_cubit.dart';
import 'package:ponygold/logic/service_cubit/my_order_cubit/my_order_cubit.dart';
import 'package:ponygold/logic/service_cubit/order_cubit/order_product_cubit.dart';
import 'package:ponygold/logic/uicubit/adding_product_cubit/adding_product_cubit.dart';
import 'package:ponygold/logic/uicubit/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:ponygold/logic/uicubit/carouselChange/caruselchange_cubit.dart';
import 'package:ponygold/logic/uicubit/changeLangButton/changelanguagebutton_cubit.dart';
import 'package:ponygold/logic/uicubit/changing_colors_cubit/choose_color_part_cubit.dart';
import 'package:ponygold/logic/uicubit/changing_game_cubit/changing_game_page_cubit.dart';
import 'package:ponygold/logic/uicubit/database_cubit/database_cubit.dart';
import 'package:ponygold/logic/uicubit/my_orders_cubit/my_orders_page_cubit.dart';
import 'package:ponygold/splash_screen.dart';
import 'data/models/basket_hive_model/basket_hive_model.dart';
import 'logic/service_cubit/brand_cubit/brand_cubit.dart';
import 'logic/service_cubit/popular_product_cubit/single_product_info_cubit.dart';
import 'logic/service_cubit/search_cubit/search_cubit.dart';
import 'logic/uicubit/changing_size_cubit/changing_and_choosing_size_cubit.dart';
import 'logic/uicubit/changing_size_cubit/choosing_female_male_cubit.dart';
import 'logic/uicubit/choosing_payment_cubit/choosing_payment_part_cubit.dart';

void main() async {
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  Hive.registerAdapter(BasketHiveModelAdapter());
  await Hive.openBox<int>('favorites');
  await Hive.openBox<int>('userId');
  await Hive.openBox<BasketHiveModel>('basketBox');
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      path: 'assets/locale',
      fallbackLocale: const Locale('ru', 'RU'),
      startLocale: const Locale('ru', 'RU'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((contextofScreen, child) {
        true;
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ChangelanguagebuttonCubit()),
            BlocProvider(create: (context) => CaruselchangeCubit()),
            BlocProvider(create: (context) => BottomNavBarCubit()),
            BlocProvider(create: (context) => SingleProductInfoCubit()),
            BlocProvider(create: (context) => AddingProductCubit()),
            BlocProvider(create: (context) => ChangingAndChoosingSizeCubit()),
            BlocProvider(create: (context) => SearchCubit()),
            BlocProvider(create: (context) => ChoosingFemaleMaleCubit()),
            BlocProvider(create: (context) => ChooseColorPartCubit()),
            BlocProvider(create: (context) => ChangingGamePageCubit()),
            BlocProvider(create: (context) => MyOrdersPageCubit()),
            BlocProvider(create: (context) => ChoosingPaymentPartCubit()),
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => GetBannersCubit()),
            BlocProvider(create: (context) => DatabaseCubit()),
            BlocProvider(create: (context) => FavoriteCubit()),
            BlocProvider(create: (context) => BrandCubit()),
            BlocProvider(create: (context) => OrderProductCubit()),
            BlocProvider(create: (context) => MyOrderCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Ponygold',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        );
      }),
    );
  }
}
