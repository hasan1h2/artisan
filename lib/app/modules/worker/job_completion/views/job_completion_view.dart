import 'package:flutter/material.dart';
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
            fontSize: 18.0,
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
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _buildWorkCompletedSection(),
                   SizedBox(height: 24.0),
                   _buildSignatureSection(),
                   SizedBox(height: 40.0),
                   _buildConfirmButton(),
                   SizedBox(height: 30.0),
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
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
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
            style: GoogleFonts.inter(fontSize: 14.0, color: AppColors.white.withAlpha(180)),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pipe Leak Repair",
                      style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    Text(
                      "Jennifer Martinez â€¢ Today",
                      style: GoogleFonts.inter(fontSize: 14.0, color: AppColors.white.withAlpha(180)),
                    ),
                  ],
                ),
                Text(
                  "\$75.00",
                  style: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold, color: const Color(0xFF4CAF50)),
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
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Completed",
            style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Obx(() => Column(
            children: List.generate(controller.checklist.length, (index) {
              final item = controller.checklist[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Icon(
                      item['checked'] as bool ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: item['checked'] as bool ? AppColors.onlineGreen : AppColors.greyText,
                      size: 20.0,
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
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
          style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.0),
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
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Client signs here",
                  style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => controller.signatureController.clear(),
            child: Text("Clear Signature", style: TextStyle(color: AppColors.urgentRed, fontSize: 12.0)),
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
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 2,
        ),
        child: Text(
          "Confirm & Complete",
          style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

