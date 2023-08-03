import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TextSeeAll extends StatelessWidget {
  const TextSeeAll({super.key, required this.text, required this.seeAll, required this.onTap});

  final String text;
  final String seeAll;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c_0C1A30,
                    fontFamily: "DMSans"),
              ),
              ZoomTapAnimation(
                onTap: onTap,
                child: Text(
                  seeAll,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_3669C9,
                      fontFamily: "DMSans"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
