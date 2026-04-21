import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../controllers/worker_job_details_controller.dart';

class WorkerJobDetailsView extends GetView<WorkerJobDetailsController> {
  const WorkerJobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkerJobDetailsController());
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
        title: Column(
          children: [
            Text(
              AppStrings.jobDetailsTitle.tr,
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Text(
              "#J1",
              style: GoogleFonts.inter(
                fontSize: 12.0,
                color: AppColors.white.withAlpha(180),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildServiceBanner(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildClientCard(),
                  SizedBox(height: 16.0),
                  _buildMapCard(),
                  SizedBox(height: 16.0),
                  _buildLocationCard(),
                  SizedBox(height: 16.0),
                  _buildChecklistCard(),
                  SizedBox(height: 24.0),
                  _buildReportBanner(),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.white.withAlpha(30),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.build_outlined, color: AppColors.white, size: 20),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pipe Leak Repair",
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "10:00 AM",
                      style: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: AppColors.white.withAlpha(180),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "\$75.00",
              style: GoogleFonts.poppins(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4CAF50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xFFD9E4F5),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alex Thompson",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Client â€¢ ",
                      style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                    ),
                    Icon(Icons.star, color: AppColors.ratingStar, size: 12.0),
                    Text(
                      " 4.8 rating",
                      style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: controller.chatClient,
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 20),
            ),
          ),
          IconButton(
            onPressed: controller.callClient,
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(Icons.call_outlined, color: AppColors.onlineGreen, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapCard() {
    return Container(
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Center(child: Image.asset(AppImages.logo, width: 100)), // Placeholder map
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: ElevatedButton.icon(
                onPressed: controller.navigateToJob,
                icon: const Icon(Icons.near_me, size: 16),
                label: const Text("Navigate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            Center(
               child: Icon(Icons.location_on, color: AppColors.errorText, size: 40.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.jobLocationTitle.tr,
            style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.primary),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "142 Oak Street, Apt 5B",
                      style: GoogleFonts.inter(fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "1.8 km away â€¢ Estimated arrival: 8 min",
                      style: GoogleFonts.inter(fontSize: 13.0, color: AppColors.greyText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.jobChecklistTitle.tr,
            style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Obx(() => Column(
            children: List.generate(controller.checklist.length, (index) {
              final item = controller.checklist[index];
              bool isChecked = item['checked'] as bool;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.toggleCheck(index),
                      child: Icon(
                        isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: isChecked ? AppColors.onlineGreen : AppColors.greyText.withAlpha(100),
                        size: 24.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      item['title'] as String,
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: isChecked ? AppColors.textColor : AppColors.greyText,
                        fontWeight: isChecked ? FontWeight.w500 : FontWeight.normal,
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

  Widget _buildReportBanner() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.ratingPromptBg,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.warningBannerIcon),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.reportAnIssue.tr,
                  style: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFFD84315)),
                ),
                Text(
                  AppStrings.problemWithThisJob.tr,
                  style: GoogleFonts.inter(fontSize: 13.0, color: Color(0xFFD84315).withAlpha(180)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

