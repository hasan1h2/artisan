import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/components/profile_menu_tile.dart';
import '../../../../core/components/custom_chip.dart';
import '../controllers/worker_account_controller.dart';

class WorkerAccountView extends GetView<WorkerAccountController> {
  const WorkerAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkerAccountController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            Transform.translate(
              offset: Offset(0, -30.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildStatsCard(),
                    SizedBox(height: 24.0),
                    _buildSkillsSection(),
                    SizedBox(height: 24.0),
                    _buildMenuSection(),
                    SizedBox(height: 24.0),
                    _buildServiceAreaSection(),
                    SizedBox(height: 30.0),
                    _buildSignOutButton(),
                    SizedBox(height: 50.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 60.0, top: 20.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: AppColors.white.withAlpha(50),
                backgroundImage: const AssetImage(AppImages.placeholderAvatar),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: AppColors.onlineGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: AppColors.white, size: 14.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            "Marcus Johnson",
            style: GoogleFonts.poppins(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: AppColors.onlineGreen,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, color: AppColors.white, size: 14.0),
                SizedBox(width: 4.0),
                Text(
                  "VERIFIED ARTISAN",
                  style: GoogleFonts.inter(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            "Certified Plumber â€¢ 5+ years",
            style: GoogleFonts.inter(
              fontSize: 14.0,
              color: AppColors.white.withAlpha(200),
            ),
          ),
          Text(
            "New York, NY â€¢ Joined 2021",
            style: GoogleFonts.inter(
              fontSize: 12.0,
              color: AppColors.white.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("203", "Jobs Done"),
          _buildVerticalDivider(),
          _buildStatItem("4.9 â˜…", "Rating"),
          _buildVerticalDivider(),
          _buildStatItem("\$4.2K", "Earnings"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.0,
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30.0,
      width: 1,
      color: AppColors.border,
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills & Services",
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 12.0),
        Obx(() => Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: controller.skills.map((skill) => CustomChip(label: skill)).toList(),
        )),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          ProfileMenuTile(
            title: "Account Verification",
            subtitle: "Verified by passport",
            iconPath: AppImages.iconShield,
            iconBgColor: AppColors.primary,
            onTap: () {},
          ),
          ProfileMenuTile(
            title: "My Reviews",
            subtitle: "203 reviews â€¢ 4.9 avg",
            iconPath: AppImages.iconHeart,
            iconBgColor: AppColors.normalYellow,
            onTap: () {},
          ),
          ProfileMenuTile(
            title: "Performance",
            subtitle: "Top 5% in your area",
            iconPath: AppImages.iconDocument,
            iconBgColor: const Color(0xFF673AB7),
            onTap: () {},
          ),
          ProfileMenuTile(
            title: "Notifications",
            subtitle: "Job alerts, payment updates",
            iconPath: AppImages.menuBell,
            iconBgColor: const Color(0xFFE91E63),
            onTap: () {},
          ),
          ProfileMenuTile(
            title: "Account Settings",
            subtitle: "Payment, availability, zones",
            iconPath: AppImages.iconLock,
            iconBgColor: AppColors.greyText,
            onTap: () {},
          ),
          ProfileMenuTile(
            title: "Help & Support",
            subtitle: "Get assistance",
            iconPath: AppImages.menuHelp,
            iconBgColor: AppColors.primary,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildServiceAreaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Service Area",
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 12.0),
        Obx(() => Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: controller.serviceAreas.map((area) => CustomChip(
            label: area,
            icon: Icon(Icons.location_on, size: 14.0, color: AppColors.urgentRed),
          )).toList(),
        )),
      ],
    );
  }

  Widget _buildSignOutButton() {
     return SizedBox(
       width: double.infinity,
       child: ElevatedButton.icon(
         onPressed: controller.signOut,
         icon: const Icon(Icons.logout),
         label: Text(AppStrings.signOut.tr),
         style: ElevatedButton.styleFrom(
           backgroundColor: const Color(0xFFFFEBEE),
           foregroundColor: AppColors.urgentRed,
           elevation: 0,
           padding: EdgeInsets.symmetric(vertical: 16.0),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
         ),
       ),
     );
  }
}

