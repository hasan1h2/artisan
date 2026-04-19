import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/static/app_colors.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String iconPath;
  final Color iconBgColor;
  final VoidCallback onTap;

  const ProfileMenuTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.iconPath,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent, // Ensure full area is clickable
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: iconBgColor.withAlpha(25),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(iconBgColor, BlendMode.srcIn),
                placeholderBuilder: (context) => Icon(
                  Icons.circle,
                  color: iconBgColor,
                  size: 24.w,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: AppColors.greyText,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.greyText,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
