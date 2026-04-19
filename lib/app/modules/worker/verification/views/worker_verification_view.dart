import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../controllers/worker_verification_controller.dart';

class WorkerVerificationView extends GetView<WorkerVerificationController> {
  const WorkerVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() {
          bool isCamera = controller.currentStep.value == 3;
          return AppBar(
            backgroundColor: isCamera ? Colors.black : AppColors.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.close, color: AppColors.white, size: 24.sp),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              controller.currentStep.value >= 4 
                  ? AppStrings.verificationSuccess.tr 
                  : AppStrings.accountVerification.tr,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.currentStep.value == 3) {
                return _buildCameraStep();
              }
              if (controller.currentStep.value == 4) {
                return _buildSuccessStep();
              }
              if (controller.currentStep.value == 5) {
                return _buildFailureStep();
              }
              return PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStep1(),
                  _buildStep2(),
                  _buildStep3(),
                ],
              );
            }),
          ),
          Obx(() {
            if (controller.currentStep.value == 3) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.all(20.r),
              child: ElevatedButton(
                onPressed: controller.nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  AppStrings.continueBtn.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSuccessStep() {
    return Padding(
      padding: EdgeInsets.all(40.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: const BoxDecoration(
              color: Color(0xFFE8F5E9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_circle, color: AppColors.onlineGreen, size: 140.sp),
          ),
          SizedBox(height: 40.h),
          Text(
            AppStrings.verificationSuccessfullyCompleted.tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFailureStep() {
    return Padding(
      padding: EdgeInsets.all(40.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: const BoxDecoration(
              color: Color(0xFFFFEBEE),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.cancel, color: AppColors.urgentRed, size: 140.sp),
          ),
          SizedBox(height: 40.h),
          Text(
            AppStrings.verificationFailed.tr,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            AppStrings.pleaseTryAgainLater.tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.documentVerification.tr,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            AppStrings.selectDocumentType.tr,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 16.h),
          _docTypeCard(
            title: AppStrings.idCard.tr,
            icon: Icons.badge_outlined,
            type: 'ID Card',
          ),
          SizedBox(height: 16.h),
          _docTypeCard(
            title: AppStrings.passport.tr,
            icon: Icons.public,
            type: 'Passport',
          ),
        ],
      ),
    );
  }

  Widget _docTypeCard({required String title, required IconData icon, required String type}) {
    return Obx(() {
      bool isSelected = controller.selectedDocType.value == type;
      return GestureDetector(
        onTap: () => controller.selectDocType(type),
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF1F4F8) : const Color(0xFFF1F4F8).withAlpha(150),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(50),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: AppColors.primary, size: 24.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: isSelected ? AppColors.primary : AppColors.greyText.withAlpha(100),
                size: 24.sp,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.documentVerification.tr,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          Text(
            AppStrings.provideIdInfo.tr,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.greyText,
            ),
          ),
          SizedBox(height: 30.h),
          _buildField(AppStrings.fullName.tr, controller.nameController, 'Alex Smith'),
          SizedBox(height: 20.h),
          _buildField(AppStrings.dob.tr, controller.dobController, 'mm/dd/yy'),
          SizedBox(height: 20.h),
          _buildField(AppStrings.idNumber.tr, controller.idNumberController, '45246282554252'),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController ctrl, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: ctrl,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(color: AppColors.greyText.withAlpha(100)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.border),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.documentVerification.tr,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          Text(
             AppStrings.takeBothSidePictures.tr,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.greyText,
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: const Color(0xFFB3E5FC),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset(
                AppImages.logo, // Placeholder for ID illustration
                width: 280.w,
                height: 180.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraStep() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            width: 320.w,
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white, width: 2),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(height: 20.h),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16.sp),
              children: [
                const TextSpan(text: 'Place the '),
                TextSpan(
                  text: 'ID Card',
                  style: GoogleFonts.poppins(color: const Color(0xFF42A5F5), fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' in the frame'), // Fixed typo "freame" from image
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: controller.nextStep,
            child: Container(
              margin: EdgeInsets.only(bottom: 40.h),
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 4),
              ),
              child: Center(
                child: Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
