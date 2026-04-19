import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/custom_role_card.dart';
import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/constants/static/app_strings.dart';
import '../controllers/role_selection_controller.dart';

class RoleSelectionView extends GetView<RoleSelectionController> {
  const RoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 40.h),
              _buildRoleSelectionCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whichDoYouWantToList.tr,
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.roleSelectionSub.tr,
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildRoleSelectionCards() {
    return Obx(() => Column(
      children: [
        CustomRoleCard(
          iconPath: AppImages.roleHelpIcon,
          title: AppStrings.iNeedHelp.tr,
          subtitle: AppStrings.iNeedHelpSub.tr,
          isSelected: controller.selectedRole.value == 'help',
          onTap: () {
            controller.selectRole('help');
          },
        ),
        CustomRoleCard(
          iconPath: AppImages.roleWorkIcon,
          title: AppStrings.iWantToWork.tr,
          subtitle: AppStrings.iWantToWorkSub.tr,
          isSelected: controller.selectedRole.value == 'work',
          onTap: () {
            controller.selectRole('work');
          },
        ),
      ],
    ));
  }
}
