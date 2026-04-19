import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_strings.dart';

class ScheduleCard extends StatelessWidget {
  final String serviceTitle;
  final String clientName;
  final String time;
  final String distance;
  final String price;
  final String duration;
  final String status; // ONGOING, UPCOMING
  final String? iconPath;

  const ScheduleCard({
    super.key,
    required this.serviceTitle,
    required this.clientName,
    required this.time,
    required this.distance,
    required this.price,
    required this.duration,
    required this.status,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    bool isOngoing = status.toUpperCase() == 'ONGOING';

    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: AppColors.socialButtonBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.build_outlined, color: AppColors.primary, size: 24.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          serviceTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: isOngoing ? const Color(0xFFE8EAF6) : const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            status,
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: isOngoing ? AppColors.primary : AppColors.greyText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      clientName,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    duration,
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: AppColors.border, height: 1),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.access_time, size: 16.sp, color: AppColors.greyText),
              SizedBox(width: 4.w),
              Text(
                time,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(width: 16.w),
              Icon(Icons.location_on_outlined, size: 16.sp, color: AppColors.greyText),
              SizedBox(width: 4.w),
              Text(
                distance,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
