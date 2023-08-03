import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/auth_provider.dart';
import 'package:techno_mir/providers/profile_provider.dart';
import 'package:techno_mir/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileScreenAdmin extends StatefulWidget {
  const ProfileScreenAdmin({super.key});

  @override
  State<ProfileScreenAdmin> createState() => _ProfileScreenAdminState();
}

class _ProfileScreenAdminState extends State<ProfileScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    User? user = context.read<ProfileProvider>().currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Screen",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().logOutUser(context);
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.c_FAFAFA,
            child: Padding(
              padding: EdgeInsets.all(26.r),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 116.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: CachedNetworkImage(
                        imageUrl: user?.photoURL == ""
                            ? "https://www.citypng.com/public/uploads/preview/png-round-blue-contact-user-profile-icon-11639786938sxvzj5ogua.png"
                            : user?.photoURL ??
                                "https://www.citypng.com/public/uploads/preview/png-round-blue-contact-user-profile-icon-11639786938sxvzj5ogua.png",
                        height: 100.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Username: ${user!.displayName == "" ? "Empty" : user.displayName}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_13181F),
                  ),
                  Text(
                    "Email: ${user.email == "" ? "Empty" : user.email}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_13181F),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GlobalTextField(
                      hintText: "Display name",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: context
                          .read<ProfileProvider>()
                          .displayNameController),
                  SizedBox(
                    height: 20.h,
                  ),
                  GlobalTextField(
                      hintText: "Email",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller:
                          context.read<ProfileProvider>().emailController),
                  SizedBox(
                    height: 20.h,
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      context.read<ProfileProvider>().updateEmail(context);
                      context
                          .read<ProfileProvider>()
                          .updateUserDisplayName(context);
                    },
                    child: Container(
                      width: 100.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.c_3669C9),
                      child: Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.white,
                              fontFamily: "DM Sans"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: context.watch<ProfileProvider>().isLoading,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 200.h,
                  width: 200.h,
                  child: SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child:
                          Center(child: Lottie.asset(AppImages.checkLoader))),
                )),
          ),
        ],
      ),
    );
  }
}
