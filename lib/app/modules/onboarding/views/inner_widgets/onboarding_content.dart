import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/static/app_colors.dart';
class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60.h), // Top padding for breathing room
          
          // Image Section with rounded Top corners (and bottom out of safety)
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 400.h,
                color: AppColors.indicatorInactive,
                child: const Icon(Icons.broken_image, size: 50),
              ),
            ),
          ),
          
          SizedBox(height: 40.h),
          
          // Text Section
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyText,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
