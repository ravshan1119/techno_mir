import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/category_provider.dart';
import 'package:techno_mir/ui/tab/home/add_category_widgets/categories.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoriesDialogPage extends StatelessWidget {
  const CategoriesDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(25.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_0C1A30,
                        fontFamily: "DMSans"),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppImages.x)),
                ],
              ),
              SizedBox(height: 23.h),
              Divider(
                color: AppColors.c_EDEDED,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_E4F3EA,
                      text: "Foods",
                      image: AppImages.foods,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType = "Foods";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_FFECE8,
                      text: "Gift",
                      image: AppImages.gift,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType = "Gift";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_FFF6E4,
                      text: "Fashion",
                      image: AppImages.fashion,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType = "Fashion";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_F1EDFC,
                      text: "Gadget",
                      image: AppImages.gadget,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType = "Gadget";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_E4F3EA,
                      text: "Computer",
                      image: AppImages.foods,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType =
                          "Computer";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                  ZoomTapAnimation(
                    child: CategoryDialog(
                      color: AppColors.c_E4F3EA,
                      text: "Souvenir",
                      image: AppImages.foods,
                    ),
                    onTap: () {
                      context.read<CategoryProvider>().categoryType =
                          "Souvenir";
                      if(context.mounted){
                        Navigator.pop(context);
                      }
                    },
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 48.h,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 48.h,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
