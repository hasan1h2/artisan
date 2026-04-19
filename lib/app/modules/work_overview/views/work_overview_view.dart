import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/components/cost_breakdown_card.dart';
import '../../../core/components/photo_thumbnail_tile.dart';
import '../controllers/work_overview_controller.dart';

class WorkOverviewView extends GetView<WorkOverviewController> {
  const WorkOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkOverviewController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.workOverview.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.back(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.timelineActive.withAlpha(20),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.timelineActive.withAlpha(50)),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: AppColors.timelineActive,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    AppStrings.live.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.timelineActive,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSuccessBanner(),
                  SizedBox(height: 16.h),
                  _buildArtisanSnippet(),
                  SizedBox(height: 16.h),
                  _buildWorkCompleted(),
                  SizedBox(height: 16.h),
                  _buildPhotosSection(),
                  SizedBox(height: 16.h),
                  _buildCostBreakdown(),
                  SizedBox(height: 16.h),
                  _buildGuaranteeBox(),
                ],
              ),
            ),
          ),
          _buildBottomActions(),
        ],
      ),
    );
  }

  Widget _buildSuccessBanner() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: AppColors.white, size: 24.w),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.serviceCompletedSuccess.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Completed at 11:54 AM · Duration: 1h 36min',
                  style: GoogleFonts.poppins(
                    color: AppColors.white.withAlpha(200),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtisanSnippet() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              AppImages.placeholderAvatar,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'James Wilson',
                  style: GoogleFonts.poppins(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Plumbing Expert',
                  style: GoogleFonts.poppins(
                    color: AppColors.greyText,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.ratingStar, size: 14.w),
                    SizedBox(width: 4.w),
                    Text(
                      '4.9 · Expert',
                      style: GoogleFonts.poppins(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle_outline, color: AppColors.statusCompletedText, size: 24.w),
        ],
      ),
    );
  }

  Widget _buildWorkCompleted() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.build_outlined, color: AppColors.primary, size: 20.w),
              SizedBox(width: 8.w),
              Text(
                AppStrings.workCompleted.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...controller.completedTasks.map((task) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: AppColors.statusCompletedText, size: 18.w),
                    SizedBox(width: 12.w),
                    Text(
                      task,
                      style: GoogleFonts.poppins(
                        color: AppColors.greyText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.photos.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            PhotoThumbnailTile(child: Icon(Icons.build, color: AppColors.greyText, size: 24.w)),
            PhotoThumbnailTile(child: Icon(Icons.water_drop, color: Colors.blue, size: 24.w)),
            PhotoThumbnailTile(child: Icon(Icons.check_box, color: Colors.green, size: 24.w)),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          '3 photos captured by artisan',
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildCostBreakdown() {
    return CostBreakdownCard(
      icon: Icons.credit_card_outlined,
      cardTitle: 'Cost Breakdown',
      items: [
        CostBreakdownItem(title: 'Labor (1.5 hrs @ \$55/hr)', amount: '\$82.50'),
        CostBreakdownItem(title: 'Parts: Pipe fitting ×2', amount: '\$18.00'),
        CostBreakdownItem(title: 'Parts: Pressure valve', amount: '\$24.50'),
        CostBreakdownItem(title: 'Platform fee (5%)', amount: '\$6.25'),
      ],
      totalLabel: 'Total Due',
      totalAmount: '\$131.25',
    );
  }

  Widget _buildGuaranteeBox() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(10),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, color: AppColors.primary, size: 18.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.serviceGuarantee.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'If the issue recurs, we\'ll fix it for free',
                  style: GoogleFonts.poppins(
                    color: AppColors.greyText,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: controller.sign,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  side: BorderSide(color: AppColors.textColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  AppStrings.sign.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ElevatedButton(
                onPressed: controller.goToPay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.goToPay.tr,
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
}
