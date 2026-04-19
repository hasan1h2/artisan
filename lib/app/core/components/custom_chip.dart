import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Widget? icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomChip({
    super.key,
    required this.label,
    this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: 8.w),
            ],
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColors.white : AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
