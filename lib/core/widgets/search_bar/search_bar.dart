import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';

import '../../../data/models/search_model.dart';
import '../../../logic/service_cubit/search_cubit/search_cubit.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
            return;
          }
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchCubit>().fetchSearch(query);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoaded) {
          final cubitList = context.watch<SearchCubit>().matchQuery;
          if (cubitList!.product!.isEmpty &&
              cubitList.category!.isEmpty &&
              cubitList.brand!.isEmpty) {
            return _buildNoSuggestion(query);
          }
          return _buildSuggestion(context, cubitList);
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox();
      },
    );
  }

  Padding _buildNoSuggestion(String query) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'По запросу “$query” ничего не найдено',
            style: AppTextStyle.medium(size: 20.0.sp, color: AppColors.blackV),
          ),
          ScreenUtil().setVerticalSpacing(17.0),
          SvgPicture.asset(AppIcons.sherlock,
              color: Colors.transparent,
              colorBlendMode: BlendMode.multiply,
              allowDrawingOutsideViewBox: true),
          ScreenUtil().setVerticalSpacing(17.0),
          Text(
            textAlign: TextAlign.center,
            'Убедитесь, что название товара или бренда написаны верно.',
            style: AppTextStyle.regular3(color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _buildSuggestion(
      BuildContext context, SearchData cubitList) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(10.0),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "history".tr(),
                      style: AppTextStyle.mediumSmall(),
                    ),
                    TextButton(
                      child: Text(
                        "clear".tr(),
                        style:
                            AppTextStyle.mediumSmall(color: AppColors.blackV),
                      ),
                      onPressed: () {
                        // context.read<SearchCubit>().forClear();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10.0),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    cubitList.category!.isNotEmpty
                        ? _buildCategory(cubitList)
                        : const SizedBox(),
                    cubitList.brand!.isNotEmpty
                        ? _buildBrand(cubitList)
                        : const SizedBox(),
                    cubitList.product!.isNotEmpty
                        ? _buildProduct(cubitList, context, query)
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Column _buildBrand(SearchData suggestion) {
    return Column(
      children: List.generate(
          suggestion.brand!.length,
          (brandIndex) => Row(
                children: [
                  Image.network(
                    suggestion.brand![brandIndex].image!,
                    height: ScreenUtil().setHeight(29),
                    width: ScreenUtil().setWidth(32),
                  ),
                  ScreenUtil().setHorizontalSpacing(13),
                  Column(
                    children: [
                      Text(
                        suggestion.brand![brandIndex].name!,
                        style: AppTextStyle.regular(size: 14),
                      ),
                      Text(
                        'Бренд',
                        style: AppTextStyle.regular(
                            size: 13, color: AppColors.colorOfButtonGrey),
                      )
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.forwardarrow)
                ],
              )),
    );
  }

  Column _buildCategory(SearchData suggestion) {
    return Column(
      children: List.generate(
          suggestion.category!.length,
          (categoryIndex) => Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.search),
                    title: Text(
                      suggestion.category![categoryIndex].name!,
                      style: AppTextStyle.mediumBig(size: 14),
                    ),
                    trailing: SvgPicture.asset(AppIcons.forwardarrow),
                  ),
                  ScreenUtil().setVerticalSpacing(10),
                  const Divider()
                ],
              )),
    );
  }

  _buildProduct(SearchData suggestion, BuildContext context, String query) {
    return Column(
      children: List.generate(
        suggestion.product!.length,
        (productIndex) {
          final queryText = suggestion.product![productIndex].name!
              .substring(0, query.length);
          final remainingText =
              suggestion.product![productIndex].name!.substring(query.length);
          return Column(
            children: [
              InkWell(
                onTap: () {
                  query = suggestion.product![productIndex].name!;
                  showResults(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultSearchPage(
                  //       query: query,
                  //     ),
                  //   ),
                  // );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: suggestion.product![productIndex]
                                        .photos!.isEmpty ||
                                    suggestion.product![productIndex].photos ==
                                        null
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                        image: NetworkImage(suggestion
                                            .product![productIndex]
                                            .photos!
                                            .first
                                            .url!),
                                        fit: BoxFit.cover))
                                : const BoxDecoration(),
                            width: ScreenUtil().setHeight(80),
                            height: ScreenUtil().setHeight(80),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(200),
                                child: RichText(
                                  text: TextSpan(
                                      text: queryText,
                                      style: AppTextStyle.semiBold(
                                          size: 14, color: AppColors.blackV),
                                      children: [
                                        TextSpan(
                                            text: remainingText,
                                            style: AppTextStyle.regular(
                                                size: 14,
                                                color: AppColors.blackV))
                                      ]),
                                ),
                              ),
                              ScreenUtil().setVerticalSpacing(2),
                              Text(
                                '${suggestion.product![productIndex].price!} сум',
                                style: AppTextStyle.medium(size: 15),
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.grey,
                            size: ScreenUtil().setWidth(17),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ScreenUtil().setVerticalSpacing(10),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
