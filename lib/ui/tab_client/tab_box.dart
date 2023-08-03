import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/tab_box_client_provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class TabBoxClient extends StatefulWidget {
  const TabBoxClient({super.key});

  @override
  TabBoxClientState createState() => TabBoxClientState();
}

class TabBoxClientState extends State<TabBoxClient> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabBoxClientProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<TabBoxClientProvider>(
        builder: (context, value, Widget? child) =>
            provider.screens[provider.getCurrentScreen],
      ),
      bottomNavigationBar: Consumer<TabBoxClientProvider>(
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
