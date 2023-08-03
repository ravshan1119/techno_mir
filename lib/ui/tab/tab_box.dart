import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/tab_box_provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class TabBoxAdmin extends StatefulWidget {
  const TabBoxAdmin({super.key});

  @override
  TabBoxAdminState createState() => TabBoxAdminState();
}

class TabBoxAdminState extends State<TabBoxAdmin> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabBoxProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<TabBoxProvider>(
        builder: (context, value, Widget? child) =>
            provider.screens[provider.getCurrentScreen],
      ),
      bottomNavigationBar: Consumer<TabBoxProvider>(
        builder: (context, value, Widget? child) => BottomNavigationBar(
          elevation: 10,
          selectedItemColor: AppColors.c_3669C9,
          onTap: (value) {
            provider.setCurrentScreen(value);
          },
          currentIndex: provider.getCurrentScreen,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.home),
              label: "HOME",
              activeIcon: SvgPicture.asset(AppImages.homeColorful),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.wishlist),
              label: "WISHLIST",
              activeIcon: SvgPicture.asset(AppImages.wishlistColorful),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.order),
              label: "ORDER",
              activeIcon: SvgPicture.asset(AppImages.orderColorful),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.login),
              label: "ACCOUNT",
              activeIcon: SvgPicture.asset(AppImages.loginColorful),
            ),
          ],
        ),
      ),
    );
  }
}
