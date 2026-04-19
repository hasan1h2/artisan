import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../controllers/help_support_controller.dart';

class FeedbackView extends GetView<HelpSupportController> {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Feedback',
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
              child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 16.w),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    _buildFeedbackSection(
                      'Subject',
                      'Short title of your issue or suggestion',
                      controller.subjectController,
                    ),
                    SizedBox(height: 16.h),
                    _buildFeedbackSection(
                      'Email Address',
                      'Write your email',
                      controller.emailController,
                    ),
                    SizedBox(height: 16.h),
                    _buildMessageSection(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: ElevatedButton(
                onPressed: controller.submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A3044), // Very dark teal/blue from mockup
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text(
                  'Submit',
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
      ),
    );
  }

  Widget _buildFeedbackSection(String title, String hint, TextEditingController ctr) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(15), // Light blue-grey background
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(30),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.primary.withAlpha(50)),
            ),
            child: TextField(
              controller: ctr,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color: AppColors.greyText.withAlpha(150), fontSize: 14.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
              style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(15),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Massage', // Using verbatim spelling from image
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(30),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.primary.withAlpha(50)),
            ),
            child: Stack(
              children: [
                TextField(
                  controller: controller.messageController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Please explain what happend...', // Using verbatim spelling
                    hintStyle: GoogleFonts.poppins(color: AppColors.greyText.withAlpha(150), fontSize: 14.sp),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 60.h),
                  ),
                  style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp),
                ),
                Positioned(
                  bottom: 16.h,
                  left: 16.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.primary.withAlpha(80)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: AppColors.textColor, size: 24.w),
                      onPressed: () {
                        // Action for adding attachment
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
