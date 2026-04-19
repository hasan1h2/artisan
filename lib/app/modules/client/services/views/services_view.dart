import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/components/service_category_card.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Services',
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                AppStrings.ourAllServices.tr,
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppStrings.goAnywhere.tr,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: AppColors.greyText,
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(() => GridView.builder(
                  padding: EdgeInsets.only(bottom: 24.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    final service = controller.services[index];
                    return ServiceCategoryCard(
                      title: service['title'],
                      imagePath: service['image'],
                      onTap: () {},
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
