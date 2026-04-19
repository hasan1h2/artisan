import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';

enum TimelineState { completed, current, pending }

class StatusTimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon; // In a full SVG implementation this would be Widget iconWidget
  final TimelineState state;
  final bool isLast;
  final Widget? trailingWidget;

  const StatusTimelineTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.time = '',
    required this.icon,
    this.state = TimelineState.pending,
    this.isLast = false,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = state == TimelineState.completed;
    final bool isCurrent = state == TimelineState.current;

    Color iconColor = AppColors.white;
    Color bgColor = AppColors.timelineInactive.withAlpha(50);
    
    if (isCompleted) {
      bgColor = AppColors.timelineActive;
    } else if (isCurrent) {
      bgColor = AppColors.timelineCurrent;
    } else {
      iconColor = AppColors.greyText; // actually the uncompleted icon is a grey background with an emoji sometimes or an icon
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40.w,
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(icon, color: iconColor, size: 20.w),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: isCompleted ? AppColors.timelineActive : AppColors.timelineInactive,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: isCurrent || isCompleted ? AppColors.textColor : AppColors.greyText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (time.isNotEmpty)
                        Row(
                          children: [
                            Icon(Icons.access_time, color: AppColors.greyText, size: 12.w),
                            SizedBox(width: 4.w),
                            Text(
                              time,
                              style: GoogleFonts.poppins(
                                color: AppColors.greyText,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontSize: 14.sp,
                    ),
                  ),
                  if (trailingWidget != null) ...[
                    SizedBox(height: 8.h),
                    trailingWidget!
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
