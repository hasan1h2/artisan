import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/components/fixed_bottom_action_bar.dart';
import '../controllers/service_details_controller.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceDetailsController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.serviceDetails.tr,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroImage(),
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleSection(),
                        SizedBox(height: 24.h),
                        _buildTabs(),
                        SizedBox(height: 24.h),
                        _buildDescription(),
                        SizedBox(height: 24.h),
                        _buildWhatsIncluded(),
                        SizedBox(height: 24.h),
                        _buildTopArtisan(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FixedBottomActionBar(
            leadingText: AppStrings.startingFrom.tr,
            leadingValue: '\$35',
            buttonText: AppStrings.bookNow.tr,
            onPressed: controller.bookNow,
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Image.asset(
              AppImages.placeholderService, // Should be a hero image, reusing placeholder
              width: double.infinity,
              height: 220.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 16.h,
              right: 16.w,
              child: Row(
                children: [
                  _buildIconButton(Icons.share, () {}),
                  SizedBox(width: 12.w),
                  Obx(() => _buildIconButton(
                        controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                        controller.toggleFavorite,
                        color: controller.isFavorite.value ? AppColors.errorText : AppColors.white,
                      )),
                ],
              ),
            ),
            Positioned(
              bottom: 16.h,
              left: 16.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.textColor.withAlpha(180),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: AppColors.ratingStar, size: 16.w),
                    SizedBox(width: 4.w),
                    Text(
                      '4.7',
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(54 reviews)',
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap, {Color color = AppColors.white}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.textColor.withAlpha(100),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20.w),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Pipe Leak Repair',
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.badgePopularBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Text('🔥', style: TextStyle(fontSize: 12.sp)),
                  SizedBox(width: 4.w),
                  Text(
                    AppStrings.popular.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.badgePopularText,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(Icons.access_time, color: AppColors.greyText, size: 16.w),
            SizedBox(width: 4.w),
            Text(
              AppStrings.hr1.tr,
              style: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
            ),
            SizedBox(width: 16.w),
            Icon(Icons.shield_outlined, color: AppColors.statusCompletedText, size: 16.w),
            SizedBox(width: 4.w),
            Text(
              AppStrings.insured.tr,
              style: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              '\$35-\$65',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.background, // actually light grey border wrapping it
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Obx(() => Row(
        children: [
          Expanded(
            child: _buildTab(AppStrings.overview.tr, controller.selectedTab.value == 'Overview'),
          ),
          Expanded(
            child: _buildTab(AppStrings.reviews.tr, controller.selectedTab.value == 'Reviews'),
          ),
        ],
      )),
    );
  }

  Widget _buildTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () => controller.changeTab(isSelected ? '' : title.split(' ').last == 'Reviews' ? 'Reviews' : 'Overview'), // Simplified toggle
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: isSelected ? AppColors.textColor : AppColors.greyText,
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      'Complete toilet repair and replacement services including flush systems, seals, and fittings.',
      style: GoogleFonts.poppins(
        color: AppColors.greyText,
        fontSize: 14.sp,
        height: 1.5,
      ),
    );
  }

  Widget _buildWhatsIncluded() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.whatsIncluded.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          ...controller.whatsIncluded.map((item) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: AppColors.statusCompletedText, size: 20.w),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          color: AppColors.greyText,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTopArtisan() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.topArtisanForThis.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      AppImages.placeholderAvatar,
                      width: 48.w,
                      height: 48.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: AppColors.statusCompletedText,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marcus Johnson',
                      style: GoogleFonts.poppins(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.ratingStar, size: 14.w),
                        SizedBox(width: 4.w),
                        Text(
                          '4.9',
                          style: GoogleFonts.poppins(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ' · 127 jobs',
                            style: GoogleFonts.poppins(
                              color: AppColors.greyText,
                              fontSize: 12.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                AppStrings.view.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
