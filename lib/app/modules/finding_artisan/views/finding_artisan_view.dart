import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/components/map_placeholder.dart';
import '../../../core/components/artisan_bottom_sheet_card.dart';
import '../controllers/finding_artisan_controller.dart';

class FindingArtisanView extends GetView<FindingArtisanController> {
  const FindingArtisanView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindingArtisanController());
    return Obx(() {
      if (controller.isFound.value) {
        return _buildMapState(context);
      } else {
        return _buildSearchingState(context);
      }
    });
  }

  Widget _buildSearchingState(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          AppStrings.findingArtisan.tr,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: AppColors.white),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          _buildRadarAnimation(),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 8.w, height: 8.w, margin: EdgeInsets.symmetric(horizontal: 4.w), decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle)),
              Container(width: 8.w, height: 8.w, margin: EdgeInsets.symmetric(horizontal: 4.w), decoration: BoxDecoration(color: AppColors.white.withAlpha(100), shape: BoxShape.circle)),
              Container(width: 8.w, height: 8.w, margin: EdgeInsets.symmetric(horizontal: 4.w), decoration: BoxDecoration(color: AppColors.white.withAlpha(100), shape: BoxShape.circle)),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            AppStrings.findingBestArtisan.tr,
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            AppStrings.checkingAvailability.tr,
            style: GoogleFonts.poppins(
              color: AppColors.white.withAlpha(150),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                _buildSearchStepNode(AppStrings.searchingNearby.tr, isCompleted: true),
                _buildSearchStepNode(AppStrings.checkingAvailability.tr, isActive: true),
                _buildSearchStepNode(AppStrings.matchingRequirements.tr),
                _buildSearchStepNode(AppStrings.artisanFoundConfirming.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadarAnimation() {
    return SizedBox(
      height: 250.w,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simulated Radar Rings
          Container(
            width: 240.w,
            height: 240.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.radarRing.withAlpha(50), width: 1),
            ),
          ),
          Container(
            width: 170.w,
            height: 170.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.radarRing.withAlpha(80), width: 1),
            ),
          ),
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.radarRing.withAlpha(150), width: 1),
            ),
          ),
          // Center Location Pin
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: AppColors.timelineActive, // Green pin bg in image
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.timelineActive.withAlpha(100),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Icon(Icons.location_on, color: AppColors.white, size: 24.w),
          ),
          // Floating simulated avatars
          Positioned(
            top: 20.h,
            left: MediaQuery.of(Get.context!).size.width * 0.3,
            child: _buildAvatarNode(40.w),
          ),
          Positioned(
            top: 80.h,
            right: 40.w,
            child: _buildAvatarNode(45.w),
          ),
          Positioned(
            bottom: 60.h,
            right: 120.w,
            child: _buildAvatarNode(50.w),
          ),
          Positioned(
            bottom: 100.h,
            left: 50.w,
            child: _buildAvatarNode(45.w),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarNode(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white.withAlpha(100), width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.asset(AppImages.placeholderAvatar, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSearchStepNode(String text, {bool isCompleted = false, bool isActive = false}) {
    Color bgColor = AppColors.white.withAlpha(10);
    Color borderColor = Colors.transparent;
    Widget leadingWidget = Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha(20),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '3', // Placeholder for index if needed, design shows 3, 4 for uncompleted
          style: TextStyle(color: AppColors.white.withAlpha(100), fontSize: 10.sp),
        ),
      ),
    );

    if (isCompleted) {
      bgColor = AppColors.timelineActive.withAlpha(20);
      borderColor = AppColors.timelineActive.withAlpha(50);
      leadingWidget = Container(
        width: 24.w,
        height: 24.w,
        decoration: const BoxDecoration(
          color: AppColors.timelineActive,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, color: AppColors.white, size: 14.w),
      );
    } else if (isActive) {
      bgColor = AppColors.white.withAlpha(15);
      borderColor = AppColors.white.withAlpha(50);
      leadingWidget = Container(
        width: 24.w,
        height: 24.w,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          leadingWidget,
          SizedBox(width: 16.w),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: isCompleted || isActive ? AppColors.white : AppColors.white.withAlpha(100),
              fontSize: 14.sp,
              fontWeight: isCompleted || isActive ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapState(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppStrings.findingArtisan.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: AppColors.textColor),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: MapPlaceholder(
        child: Stack(
          children: [
            // Center pin simulating map avatar
            Center(
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 3),
                  boxShadow: [
                    BoxShadow(color: AppColors.primary.withAlpha(50), blurRadius: 15)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Image.asset(AppImages.placeholderAvatar, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ArtisanBottomSheetCard(
                headerWidget: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.timelineActive.withAlpha(20),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: AppColors.timelineActive, size: 16.w),
                        SizedBox(width: 8.w),
                        Text(
                          'Artisan Found!',
                          style: GoogleFonts.poppins(
                            color: AppColors.timelineActive,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                avatarPath: AppImages.placeholderAvatar,
                name: 'Marcus Johnson',
                details: 'Plumber · 1.2 km\nETA: 12 min', // Simplified styling for demo, normally use RichText.
                ratingValue: '4.9',
                ratingText: 'Rating',
                actionWidget: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.trackArtisan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      AppStrings.trackArtisan.tr,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
