import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/app_images.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.title, required this.currency, required this.price, required this.images});

  final String title;
  final String currency;
  final String price;
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      height: 242.h,
      width: 156.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.c_EDEDED,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 15.h, bottom: 20.h, left: 10.w, right: 10.w),
              child: SizedBox(
                height: 125.h,
                width: 125.h,
                child: CachedNetworkImage(
                  imageUrl: images[0],
                  placeholder: (context, url) => const Padding(
                    padding: EdgeInsets.all(50),
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "DMSans",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.c_0C1A30,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "${currency} ${price}",
              style: TextStyle(
                fontFamily: "DMSans",
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.c_FE3A30,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.starColorful),
                    SizedBox(height: 3.w),
                    Text(
                      "4.6",
                      style: TextStyle(
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: AppColors.c_0C1A30,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    Text(
                      "86 Reviews",
                      style: TextStyle(
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: AppColors.c_0C1A30,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(AppImages.more),
              ],
            ),
          )
        ],
      ),
    );
  }
}
