import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/data/model/category/category_model.dart';
import 'package:techno_mir/providers/category_provider.dart';
import 'package:techno_mir/ui/auth/widgets/global_button.dart';
import 'package:techno_mir/ui/auth/widgets/global_text_fields.dart';
import 'package:techno_mir/ui/tab/home/add_category_widgets/categories_dialog_page.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UpdateCategoryPage extends StatefulWidget {
  const UpdateCategoryPage({super.key, required this.categoryId, required this.imageUrl});

  final String categoryId;
  final String imageUrl;

  @override
  State<UpdateCategoryPage> createState() => _UpdateCategoryPageState();
}

class _UpdateCategoryPageState extends State<UpdateCategoryPage> {

  String imagePath = defaultImageConstant;
  ImagePicker picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Update Category",
                  style: TextStyle(
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      color: AppColors.c_3669C9),
                ),
              ),
              SizedBox(height: 20.h),
              GlobalTextField(
                  hintText: "Update Name",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: context.read<CategoryProvider>().addNameController),
              SizedBox(height: 20.h),
              GlobalTextField(
                  hintText: "Update Description",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller:
                  context.read<CategoryProvider>().addDescriptionController),
              SizedBox(height: 20.h),
              ZoomTapAnimation(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const Dialog(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CategoriesDialogPage(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: AppColors.c_3A9B7A),
                  child: Center(
                      child: Text(
                        "Selected Category",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontFamily: "LeagueSpartan",
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              ZoomTapAnimation(
                onTap: (){
                  showBottomSheetDialog();
                },
                child: Container(
                  padding: EdgeInsets.all(14.sp),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.c_FDA429),
                  child: Center(
                    child: imagePath == defaultImageConstant
                        ? Text(
                      imagePath,
                      style:  TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontFamily: "LeagueSpartan",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                        : Image.file(
                      File(imagePath),
                    ),),
                ),
              ),
              SizedBox(height: 20.h),

              GlobalButton(
                  title: "Save Category",
                  onTap: () {
                    if (context
                        .read<CategoryProvider>()
                        .addDescriptionController
                        .text ==
                        "" ||
                        context
                            .read<CategoryProvider>()
                            .addDescriptionController
                            .text ==
                            "") {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("name or decs Empty")));
                    } else {
                      context.read<CategoryProvider>().updateCategory(
                        context: context,
                        categoryModel: CategoryModel(
                          categoryId: widget.categoryId,
                          categoryName: context.read<CategoryProvider>().addNameController.text,
                          description: context.read<CategoryProvider>().addDescriptionController.text,
                          imageUrl: imagePath,
                          createdAt: DateTime.now().toString(),
                        ),
                      );
                      context.read<CategoryProvider>().addNameController.clear();
                      context
                          .read<CategoryProvider>()
                          .addDescriptionController
                          .clear();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }
}
