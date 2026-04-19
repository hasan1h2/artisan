import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/routes/app_routes.dart';

class ResetSuccessView extends StatelessWidget {
  const ResetSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 150.w,
                height: 150.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withAlpha(25), // Light blue background
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppImages.successShieldIcon,
                  width: 80.w,
                  height: 80.w,
                  // Fallback in case asset is missing
                  placeholderBuilder: (context) => Icon(
                    Icons.verified_user,
                    size: 80.w,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                AppStrings.success.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                AppStrings.successSub.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.greyText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: AppStrings.continueBtn.tr,
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
