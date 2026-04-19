import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';

class ArtisanBottomSheetCard extends StatelessWidget {
  final Widget? headerWidget;
  final String avatarPath;
  final String name;
  final String? badgeText;
  final String details;
  final String? ratingText; // "Rating" text above star
  final String ratingValue;
  final Widget? trailingIcon;
  final Widget actionWidget;

  const ArtisanBottomSheetCard({
    super.key,
    this.headerWidget,
    required this.avatarPath,
    required this.name,
    this.badgeText,
    required this.details,
    this.ratingText,
    required this.ratingValue,
    this.trailingIcon,
    required this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (headerWidget != null) ...[
            headerWidget!,
            SizedBox(height: 24.h),
          ],
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  avatarPath,
                  width: 56.w,
                  height: 56.w,
                  fit: BoxFit.cover,
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
                          name,
                          style: GoogleFonts.poppins(
                            color: AppColors.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (badgeText != null) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.statusCompletedBg,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              badgeText!,
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
                    SizedBox(height: 4.h),
                    Text(
                      details,
                      style: GoogleFonts.poppins(
                        color: AppColors.greyText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailingIcon != null) trailingIcon! 
              else Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (ratingText != null)
                    Text(
                      ratingText!,
                      style: GoogleFonts.poppins(
                        color: AppColors.greyText,
                        fontSize: 12.sp,
                      ),
                    ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.ratingStar, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        ratingValue,
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          actionWidget,
        ],
      ),
    );
  }
}
