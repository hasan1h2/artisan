import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.editProfile.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.0,
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: _buildAvatarSection()),
                  SizedBox(height: 32.0),
                  _buildForm(),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: ElevatedButton(
                onPressed: controller.saveChanges,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 56.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.saveChanges.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Stack(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                AppImages.placeholderAvatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: controller.pickImage,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(Icons.edit_outlined, color: AppColors.primary, size: 20.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(AppStrings.fullName.tr, controller.fullNameController),
        SizedBox(height: 24.0),
        _buildInputField(AppStrings.email.tr, controller.emailController),
        SizedBox(height: 24.0),
        _buildInputField(AppStrings.number.tr, controller.phoneController),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController ctr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(10),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextField(
            controller: ctr,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}

