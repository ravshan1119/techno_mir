import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:techno_mir/utils/app_images.dart';
import 'package:techno_mir/utils/ui_utils/custom_circular.dart';


void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child: const Center(
            child: SizedBox(
              height: 70.0,
              width: 70.0,
              child: CustomCircularProgressIndicator(strokeWidth: 6,),
            ),
          ),
        ),
      );
    },
  );
}

void updateLoader({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          height: 200.h,
          width: 200.h,
          child: SizedBox(
              height: 100.h,
              width: 100.h,
              child: Center(child: Lottie.asset(AppImages.checkLoader))),
        ),
      );
    },
  );
}



void hideLoading({required BuildContext? dialogContext}) async {
  if (dialogContext != null) Navigator.pop(dialogContext);
}

void hideLoader({required BuildContext? context}) async {
  if (context != null) Navigator.pop(context);
}