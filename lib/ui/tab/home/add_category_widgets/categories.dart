import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techno_mir/utils/app_colors.dart';

class CategoryDialog extends StatelessWidget {
  const CategoryDialog({super.key, required this.color, required this.text, required this.image});

  final Color color;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: color,
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: TextStyle(
              fontFamily: "DMSans",
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.c_0C1A30),
        )
      ],
    );
  }
}
