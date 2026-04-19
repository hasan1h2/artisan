import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_strings.dart';

class RequestCard extends StatelessWidget {
  final String clientName;
  final String serviceTitle;
  final String address;
  final String distance;
  final String time;
  final String price;
  final String tag; // URGENT, NORMAL
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onCall;
  final VoidCallback onChat;

  const RequestCard({
    super.key,
    required this.clientName,
    required this.serviceTitle,
    required this.address,
    required this.distance,
    required this.time,
    required this.price,
    required this.tag,
    required this.onAccept,
    required this.onDecline,
    required this.onCall,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    bool isUrgent = tag.toUpperCase() == 'URGENT';

    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isUrgent ? AppColors.urgentRed.withAlpha(50) : AppColors.border,
          width: isUrgent ? 1.5 : 1,
        ),
        boxShadow: [
          if (isUrgent)
            BoxShadow(
              color: AppColors.urgentRed.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isUrgent ? AppColors.urgentRed : AppColors.normalYellow,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      isUrgent ? Icons.flash_on : Icons.access_time_filled,
                      color: AppColors.white,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.timer_outlined, size: 14.sp, color: AppColors.greyText),
                  SizedBox(width: 4.w),
                  Text(
                    "0:40s",
                    style: GoogleFonts.inter(fontSize: 12.sp, color: AppColors.greyText),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.socialButtonBg,
                child: Icon(Icons.person, color: AppColors.greyText),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14.sp, color: AppColors.normalYellow),
                        SizedBox(width: 4.w),
                        Text(
                          "4.8 Client Rating",
                          style: GoogleFonts.inter(fontSize: 12.sp, color: AppColors.greyText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.socialButtonBg,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                _buildInfoRow(Icons.build_outlined, serviceTitle),
                SizedBox(height: 8.h),
                _buildInfoRow(Icons.location_on_outlined, address),
                SizedBox(height: 8.h),
                _buildInfoRow(Icons.access_time, "$distance away • $time drive"),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCall,
                  icon: Icon(Icons.call_outlined, size: 18.sp),
                  label: Text(AppStrings.call.tr),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textColor,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onChat,
                  icon: Icon(Icons.chat_bubble_outline, size: 18.sp),
                  label: Text(AppStrings.chat.tr),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textColor,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onDecline,
                  icon: const Icon(Icons.close),
                  label: Text(AppStrings.decline.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEBEE),
                    foregroundColor: AppColors.urgentRed,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: const Icon(Icons.check),
                  label: Text(AppStrings.accept.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: AppColors.greyText),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
