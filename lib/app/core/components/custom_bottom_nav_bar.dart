import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_images.dart';

class NavItemData {
  final String label;
  final String svgPath;

  NavItemData({required this.label, required this.svgPath});
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItemData> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
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
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return _buildNavItem(index, items[index].label, items[index].svgPath);
            }),
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
        padding: isActive ? EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0) : EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.bottomNavActiveBg : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 24.0,
              height: 24.0,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : AppColors.greyText,
                BlendMode.srcIn,
              ),
              placeholderBuilder: (context) => Icon(
                Icons.circle,
                size: 24.0,
                color: isActive ? AppColors.primary : AppColors.greyText,
              ),
            ),
            if (isActive) ...[
              SizedBox(width: 8.0),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 14.0,
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

