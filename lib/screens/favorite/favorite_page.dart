import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/widgets/product_widget.dart';
import 'package:ponygold/logic/service_cubit/add_favorite_cubit/favorite_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final PageController controller = PageController();

  @override
  void initState() {
    context.read<FavoriteCubit>().fetchFavorites(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavoriteLoaded) {
          return Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15.0),
              right: ScreenUtil().setWidth(15.0),
            ),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // maxCrossAxisExtent: ScreenUtil().setWidth(288.0),
                  mainAxisExtent: ScreenUtil().setHeight(300.0),
                  childAspectRatio: 4 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: state.favoriteProduct.length,
              itemBuilder: (BuildContext ctx, index) {
                return ProductWidget(
                    subProduct: state.favoriteProduct[index],
                    controller: controller,
                    index: index);
              },
            ),
          );
        }
        return const Center(
          child: Text('No Favorites'),
        );
      },
    );
  }
}
