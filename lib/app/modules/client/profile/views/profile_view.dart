import 'package:flutter/material.dart';
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
              offset: Offset(0, -40.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    _buildStatsRow(),
                    SizedBox(height: 24.0),
                    _buildMenuTiles(),
                    SizedBox(height: 32.0),
                    _buildRecentBookings(),
                    SizedBox(height: 32.0),
                    _buildSignOutButton(),
                    SizedBox(height: 40.0),
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
      padding: EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0, bottom: 80.0),
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
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColors.white.withAlpha(25),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(Icons.edit_outlined, color: AppColors.white, size: 20.0),
              ),
            ],
          ),
          SizedBox(height: 24.0),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        AppImages.placeholderAvatar,
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 70.0,
                          height: 70.0,
                          color: AppColors.white.withAlpha(50),
                          child: Icon(Icons.person, color: AppColors.white, size: 40.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: AppColors.statusCompletedText,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit, color: AppColors.white, size: 10.0),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.userName.value,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      controller.userEmail.value,
                      style: GoogleFonts.poppins(
                        color: AppColors.white.withAlpha(200),
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      controller.userPhone.value,
                      style: GoogleFonts.poppins(
                        color: AppColors.white.withAlpha(200),
                        fontSize: 12.0,
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
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(200), // Slightly lighter than background primary based on image. The image shows a darker blue container. Actually, #2c5991 style color, let's just use withAlpha or a similar tone. Wait, the background is primary, stats box is a bit lighter.
        borderRadius: BorderRadius.circular(16.0),
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
          Container(width: 1.0, height: 40.0, color: AppColors.white.withAlpha(50)),
          _buildStatItem(controller.stats['reviews'].toString(), AppStrings.reviews.tr),
          Container(width: 1.0, height: 40.0, color: AppColors.white.withAlpha(50)),
          _buildStatItem('${controller.stats['rating']} â˜…', AppStrings.ratingGiven.tr),
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
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.white.withAlpha(200),
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTiles() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
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
        padding: EdgeInsets.all(16.0),
        itemCount: controller.menuItems.length,
        separatorBuilder: (context, index) => Divider(color: AppColors.border, height: 1.0),
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
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            Text(
              AppStrings.seeAll.tr,
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.recentBookings.length,
          itemBuilder: (context, index) {
            final order = controller.recentBookings[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(Icons.build, color: AppColors.greyText, size: 24.0),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          order['date'],
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
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
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.statusCompletedText,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        order['price'],
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
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
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.errorText, size: 24.0),
            SizedBox(width: 8.0),
            Text(
              AppStrings.signOut.tr,
              style: GoogleFonts.poppins(
                color: AppColors.errorText,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

