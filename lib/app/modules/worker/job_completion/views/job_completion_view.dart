import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../controllers/job_completion_controller.dart';

class JobCompletionView extends GetView<JobCompletionController> {
  const JobCompletionView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobCompletionController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Job Completion",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildJobSummaryHeader(),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _buildWorkCompletedSection(),
                   SizedBox(height: 24.h),
                   _buildSignatureSection(),
                   SizedBox(height: 40.h),
                   _buildConfirmButton(),
                   SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobSummaryHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get client signature to complete",
            style: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.white.withAlpha(180)),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pipe Leak Repair",
                      style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    Text(
                      "Jennifer Martinez • Today",
                      style: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.white.withAlpha(180)),
                    ),
                  ],
                ),
                Text(
                  "\$75.00",
                  style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.bold, color: const Color(0xFF4CAF50)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkCompletedSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Completed",
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Obx(() => Column(
            children: List.generate(controller.checklist.length, (index) {
              final item = controller.checklist[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  children: [
                    Icon(
                      item['checked'] as bool ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: item['checked'] as bool ? AppColors.onlineGreen : AppColors.greyText,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColors.textColor.withAlpha(200),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )),
        ],
      ),
    );
  }

  Widget _buildSignatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Client Signature",
          style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.border, style: BorderStyle.solid),
          ),
          child: Column(
            children: [
              Expanded(
                child: Signature(
                  controller: controller.signatureController,
                  backgroundColor: Colors.transparent,
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  "Client signs here",
                  style: GoogleFonts.inter(fontSize: 12.sp, color: AppColors.greyText),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => controller.signatureController.clear(),
            child: Text("Clear Signature", style: TextStyle(color: AppColors.urgentRed, fontSize: 12.sp)),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.completeJob,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 2,
        ),
        child: Text(
          "Confirm & Complete",
          style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
