import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/drawer/third_drawer_page.dart';

import '../../../logic/service_cubit/fetchCategoryCubit/fetch_category_data_cubit.dart';

class SecondDrawerPage extends StatefulWidget {
  const SecondDrawerPage({super.key});

  @override
  State<SecondDrawerPage> createState() => _SecondDrawerPageState();
}

class _SecondDrawerPageState extends State<SecondDrawerPage> {
  int indexOfDrawer = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCategoryDataCubit()..fetchCategoryData(),
      child: BlocBuilder<FetchCategoryDataCubit, FetchCategoryDataState>(
        builder: (context, state) {
          if (state is FetchCategoryDataLoaded) {
            final value = state.categoryList;
            return Scaffold(
              drawer: ThirdDrawerPage(
                  data: value[indexOfDrawer].subCategories!,
                  categoryName: value[indexOfDrawer].name!),
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
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: SvgPicture.asset(
                              AppIcons.laptop,
                            ),
                            title: Text(value[index].name.toString()),
                            trailing: SvgPicture.asset(
                              AppIcons.forwardarrow,
                              color: AppColors.colorOfButtonGrey,
                            ),
                            onTap: () {
                              indexOfDrawer = index;
                              setState(() {});
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        }),
                  )
                ],
              ),
            );
          } else if (state is FetchCategoryDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Ошибка"),
            );
          }
        },
      ),
    );
  }
}
