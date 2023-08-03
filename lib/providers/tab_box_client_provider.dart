import 'package:flutter/material.dart';
import 'package:techno_mir/ui/tab_client/home/home_screen.dart';
import 'package:techno_mir/ui/tab_client/order/order_screen.dart';
import 'package:techno_mir/ui/tab_client/profil/profile_screen.dart';
import 'package:techno_mir/ui/tab_client/wishlist/wishlist_screen.dart';

class TabBoxClientProvider extends ChangeNotifier {
  int _currentScreen = 0;

  TabBoxClientProvider();

  List<Widget> screens = [
    HomeScreenClient(),
    WishlistScreenClient(),
    OrderScreenClient(),
    ProfileScreenClient()
  ];

  get getCurrentScreen => _currentScreen;

  setCurrentScreen(int currentIndex) {
    _currentScreen = currentIndex;
    notifyListeners();
  }
}
