import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techno_mir/ui/tab_client/home/add_category_widgets/categories.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_E4F3EA,
                text: "Foods",
                image: AppImages.foods,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_FFECE8,
                text: "Gift",
                image: AppImages.gift,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_FFF6E4,
                text: "Fashion",
                image: AppImages.fashion,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_F1EDFC,
                text: "Gadget",
                image: AppImages.gadget,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_E4F3EA,
                text: "Computer",
                image: AppImages.foods,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ZoomTapAnimation(
              child: CategoryDialog(
                color: AppColors.c_E4F3EA,
                text: "Souvenir",
                image: AppImages.foods,
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
