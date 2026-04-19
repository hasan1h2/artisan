import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/components/profile_menu_tile.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Transform.translate(
              offset: Offset(0, -40.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    _buildStatsRow(),
                    SizedBox(height: 24.h),
                    _buildMenuTiles(),
                    SizedBox(height: 32.h),
                    _buildRecentBookings(),
                    SizedBox(height: 32.h),
                    _buildSignOutButton(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w, bottom: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.myProfile.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.white.withAlpha(25),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.edit_outlined, color: AppColors.white, size: 20.w),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2.w),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        AppImages.placeholderAvatar,
                        width: 70.w,
                        height: 70.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 70.w,
                          height: 70.w,
                          color: AppColors.white.withAlpha(50),
                          child: Icon(Icons.person, color: AppColors.white, size: 40.w),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: AppColors.statusCompletedText,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit, color: AppColors.white, size: 10.w),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.userName.value,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      controller.userEmail.value,
                      style: GoogleFonts.poppins(
                        color: AppColors.white.withAlpha(200),
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      controller.userPhone.value,
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
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(200), // Slightly lighter than background primary based on image. The image shows a darker blue container. Actually, #2c5991 style color, let's just use withAlpha or a similar tone. Wait, the background is primary, stats box is a bit lighter.
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(controller.stats['bookings'].toString(), AppStrings.bookings.tr),
          Container(width: 1.w, height: 40.h, color: AppColors.white.withAlpha(50)),
          _buildStatItem(controller.stats['reviews'].toString(), AppStrings.reviews.tr),
          Container(width: 1.w, height: 40.h, color: AppColors.white.withAlpha(50)),
          _buildStatItem('${controller.stats['rating']} ★', AppStrings.ratingGiven.tr),
        ],
      )),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.white.withAlpha(200),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTiles() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Obx(() => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        itemCount: controller.menuItems.length,
        separatorBuilder: (context, index) => Divider(color: AppColors.border, height: 1.h),
        itemBuilder: (context, index) {
          final item = controller.menuItems[index];
          return ProfileMenuTile(
            title: item['title'] as String,
            subtitle: item['subtitle'] as String?,
            iconPath: item['icon'] as String,
            iconBgColor: item['color'] as Color,
            onTap: () {},
          );
        },
      )),
    );
  }

  Widget _buildRecentBookings() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.recentBookings.tr,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            Text(
              AppStrings.seeAll.tr,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.recentBookings.length,
          itemBuilder: (context, index) {
            final order = controller.recentBookings[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.build, color: AppColors.greyText, size: 24.w),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          order['date'],
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        order['status'],
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.statusCompletedText,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        order['price'],
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        )),
      ],
    );
  }

  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.signOut,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.statusCancelledBg,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.errorText, size: 24.w),
            SizedBox(width: 8.w),
            Text(
              AppStrings.signOut.tr,
              style: GoogleFonts.poppins(
                color: AppColors.errorText,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
