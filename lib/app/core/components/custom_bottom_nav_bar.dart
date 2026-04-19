import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10), // ~4% opacity
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, 'Home', AppImages.navHome),
              _buildNavItem(1, 'Services', AppImages.navServices),
              _buildNavItem(2, 'Activity', AppImages.navActivity),
              _buildNavItem(3, 'Account', AppImages.navProfile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String svgPath) {
    final isActive = currentIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: isActive ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h) : EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: isActive ? AppColors.bottomNavActiveBg : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : AppColors.greyText,
                BlendMode.srcIn,
              ),
              placeholderBuilder: (context) => Icon(
                Icons.circle,
                size: 24.w,
                color: isActive ? AppColors.primary : AppColors.greyText,
              ),
            ),
            if (isActive) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
