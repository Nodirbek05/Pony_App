import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ponygold/screens/favorite/favorite_page.dart';
import 'package:ponygold/screens/game_page/game_info_page.dart';
import 'package:ponygold/screens/home/home_page.dart';
import 'package:ponygold/screens/profile/profile_page.dart';
import 'package:ponygold/screens/shop/shop_page.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int pageIndex = 0;

  List pages = const [
    HomePage(),
    ShopPage(),
    FavoritePage(),
    ProfilePage(),
    GameInfoPage(),
  ];

  changePages(int tappedIndex) {
    pageIndex = tappedIndex;
    emit(BottomNavBarInitial());
  }
}
