import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/static/app_colors.dart';

class CustomSocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const CustomSocialButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: const BoxDecoration(
          color: AppColors.socialButtonBg,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          iconPath,
          width: 30.w,
          height: 30.w,
          placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
