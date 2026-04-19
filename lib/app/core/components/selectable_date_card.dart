import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';

class SelectableDateCard extends StatelessWidget {
  final String day;
  final String date;
  final String month;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableDateCard({
    super.key,
    required this.day,
    required this.date,
    required this.month,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: isSelected ? null : Border.all(color: AppColors.border),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(50),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: GoogleFonts.poppins(
                color: isSelected ? AppColors.white.withAlpha(200) : AppColors.greyText,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              date,
              style: GoogleFonts.poppins(
                color: isSelected ? AppColors.white : AppColors.textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              month,
              style: GoogleFonts.poppins(
                color: isSelected ? AppColors.white.withAlpha(200) : AppColors.greyText,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
