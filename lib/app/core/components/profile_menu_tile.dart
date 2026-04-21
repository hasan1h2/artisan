import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: iconBgColor.withAlpha(25),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                width: 24.0,
                height: 24.0,
                colorFilter: ColorFilter.mode(iconBgColor, BlendMode.srcIn),
                placeholderBuilder: (context) => Icon(
                  Icons.circle,
                  color: iconBgColor,
                  size: 24.0,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.0),
                    Text(
                      subtitle!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.0,
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
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}

