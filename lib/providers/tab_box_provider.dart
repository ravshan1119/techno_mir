import 'package:flutter/material.dart';
import 'package:techno_mir/ui/tab/home/home_screen.dart';
import 'package:techno_mir/ui/tab/order/order_screen.dart';
import 'package:techno_mir/ui/tab/profil/profile_screen.dart';
import 'package:techno_mir/ui/tab/wishlist/wishlist_screen.dart';

class TabBoxProvider extends ChangeNotifier {
  int _currentScreen = 0;

  TabBoxProvider();

  List<Widget> screens = [
    HomeScreenAdmin(),
    WishlistScreenAdmin(),
    OrderScreenAdmin(),
    ProfileScreenAdmin()
  ];

  get getCurrentScreen => _currentScreen;

  setCurrentScreen(int currentIndex) {
    _currentScreen = currentIndex;
    notifyListeners();
  }
}
