import 'package:flutter/material.dart';
import 'package:techno_mir/ui/auth/auth_screen.dart';
import 'package:techno_mir/ui/tab/home/home_screen.dart';
import 'package:techno_mir/ui/tab/order/order_screen.dart';
import 'package:techno_mir/ui/tab/profil/profile_screen.dart';
import 'package:techno_mir/ui/tab/tab_box.dart';
import 'package:techno_mir/ui/tab/wishlist/wishlist_screen.dart';

class RouteNames {
  static const String tabBox = "/tab_box_screen";
  static const String homeScreen = "/home_screen";
  static const String orderScreen = "/order_screen";
  static const String wishlistScreen = "/wishlist_screen";
  static const String profileScreen = "/profile_screen";
  static const String auth = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.auth:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreenAdmin(),
        );
      case RouteNames.orderScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderScreenAdmin(),
        );
      case RouteNames.wishlistScreen:
        return MaterialPageRoute(
          builder: (context) => const WishlistScreenAdmin(),
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreenAdmin(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) =>  TabBoxAdmin(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}