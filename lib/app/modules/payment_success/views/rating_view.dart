import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../controllers/payment_success_controller.dart';

class RatingView extends GetView<PaymentSuccessController> {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.paymentSuccessful.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: UnconstrainedBox(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(left: 16.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.socialButtonBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: AppColors.textColor, size: 16.w),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isReviewSubmitted.value) {
          return _buildSuccessState();
        } else {
          return _buildRatingState();
        }
      }),
    );
  }

  Widget _buildRatingState() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'How was your experience?',
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your feedback helps improve service quality and\nhelps others choose the right worker.',
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor.withAlpha(200),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Rate your experience',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildStarsRow(),
                  SizedBox(height: 32.h),
                  _buildReviewInput(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: controller.submitReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                elevation: 0,
              ),
              child: Text(
                'Submit Review',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarsRow() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          final isSelected = index < controller.rating.value;
          return GestureDetector(
            onTap: () => controller.rating.value = index + 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Icon(
                Icons.star_rounded,
                color: isSelected ? AppColors.ratingStar : AppColors.indicatorInactive,
                size: 44.w,
              ),
            ),
          );
        }),
      );
    });
  }

  Widget _buildReviewInput() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.textColor, width: 0.8),
      ),
      child: TextField(
        controller: controller.reviewController,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: 'Share your experience with the worker...',
          hintStyle: GoogleFonts.poppins(color: AppColors.greyText.withAlpha(200), fontSize: 13.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
        style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 13.sp),
      ),
    );
  }

  Widget _buildSuccessState() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140.w,
                    height: 140.w,
                    decoration: BoxDecoration(
                      color: AppColors.statusCompletedText,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.statusCompletedText.withAlpha(200),
                          AppColors.statusCompletedText,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_rounded,
                        color: AppColors.white,
                        size: 80.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Thank you for your\nfeedback!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Your review has been submitted successfully.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor.withAlpha(200),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.backToHome,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                elevation: 0,
              ),
              child: Text(
                AppStrings.backToHome.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
