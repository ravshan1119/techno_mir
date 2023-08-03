import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../providers/auth_provider.dart';
import '../../../utils/app_colors.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """Welcome back to\nTechno City""",
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
              "Please enter data to login",
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
              height: 30.h,
            ),
            Text(
              "Password",
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
              obscureText: true,
                hintText: "password",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                controller:
                context.read<AuthProvider>().passwordController),
            SizedBox(
              height: 70.h,
            ),
            GlobalButton(
                title: "Sign in",
                onTap: () {
                  context.read<AuthProvider>().loginUser(context);
                }),
            SizedBox(
              height: 130.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Forgot Password",
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
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.c_3669C9,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}