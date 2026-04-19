import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';

class AddressSelectionCard extends StatelessWidget {
  final String title;
  final String address;
  final bool isDefault;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressSelectionCard({
    super.key,
    required this.title,
    required this.address,
    this.isDefault = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withAlpha(10) : AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(20),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.background,
                shape: BoxShape.circle,
                border: isSelected ? null : Border.all(color: AppColors.border),
              ),
              child: Icon(
                Icons.location_on,
                color: isSelected ? AppColors.white : AppColors.greyText,
                size: 20.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isDefault) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.statusCompletedBg,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Default',
                            style: GoogleFonts.poppins(
                              color: AppColors.statusCompletedText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    address,
                    style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_outline, color: AppColors.primary, size: 24.w)
          ],
        ),
      ),
    );
  }
}
