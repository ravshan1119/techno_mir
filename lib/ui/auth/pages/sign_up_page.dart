import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../providers/auth_provider.dart';
import '../../../utils/app_colors.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """Register Account""",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "DMSans",
                  color: AppColors.c_0C1A30),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Enter Email/No. Phone to register ",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "DMSans",
                  color: AppColors.c_838589),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Email/ Phone",
              style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "DMSans",
                  color: AppColors.c_0C1A30),
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalTextField(
                hintText: "email / phone",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().emailController),
            SizedBox(
              height: 20.h,
            ),
            GlobalTextField(
                hintText: "password",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().passwordController),
            SizedBox(
              height: 100.h,
            ),
            ZoomTapAnimation(
              onTap: () {
                context.read<AuthProvider>().signInWithGoogle(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border:
                        Border.all(width: 1, color: AppColors.textColorLight)),
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sign Up with google"),
                    SizedBox(
                      width: 15.w,
                    ),
                    SvgPicture.asset(AppImages.google),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GlobalButton(
                title: "Continue",
                onTap: () {
                  context.read<AuthProvider>().signUpUser(context);
                }),
            SizedBox(
              height: 104.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an Account?",
                  style: TextStyle(
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.c_0C1A30,
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    onChanged.call();
                    context.read<AuthProvider>().signupButtonPressed();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.c_3669C9,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
