import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/components/worker_stat_card.dart';
import '../../../../core/components/schedule_card.dart';
import '../controllers/worker_home_controller.dart';

class WorkerDashboardView extends GetView<WorkerHomeController> {
  const WorkerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is initialized
    Get.put(WorkerHomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 20.h),
                   _buildStatsRow(),
                   SizedBox(height: 20.h),
                   _buildIncomingRequestBanner(),
                   SizedBox(height: 24.h),
                   _buildScheduleHeader(),
                   SizedBox(height: 12.h),
                   _buildScheduleList(),
                   SizedBox(height: 24.h),
                   _buildWeeklySummaryHeader(),
                   SizedBox(height: 12.h),
                   _buildWeeklySummaryCards(),
                   SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight + 20.h, left: 20.w, right: 20.w, bottom: 30.h),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: Colors.white24,
                backgroundImage: const AssetImage(AppImages.placeholderAvatar),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      "Marcus Johnson",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: Badge(
                  alignment: Alignment.topRight,
                  backgroundColor: AppColors.urgentRed,
                  child: Icon(Icons.notifications_none, color: Colors.white, size: 24.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Row(
                   children: [
                     Container(
                       width: 10.w,
                       height: 10.w,
                       decoration: const BoxDecoration(
                         color: AppColors.onlineGreen,
                         shape: BoxShape.circle,
                       ),
                     ),
                     SizedBox(width: 8.w),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "You are Online",
                           style: GoogleFonts.poppins(
                             fontSize: 16.sp,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         Text(
                           "Receiving new requests",
                           style: GoogleFonts.inter(
                             fontSize: 12.sp,
                             color: Colors.white70,
                           ),
                         ),
                       ],
                     ),
                   ],
                ),
                const Spacer(),
                Obx(() => Switch(
                  value: controller.isOnline.value,
                  onChanged: controller.toggleStatus,
                  activeThumbColor: Colors.white,
                  activeTrackColor: AppColors.onlineGreen,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: WorkerStatCard(
            title: "Today's Earnings",
            value: "\$130",
            subtitle: "+12% vs yesterday",
            subtitleColor: AppColors.onlineGreen,
            backgroundColor: AppColors.white,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: WorkerStatCard(
            title: "Today's Jobs",
            value: "2",
            subtitle: "Rating: 4.9",
            subtitleColor: AppColors.normalYellow,
            icon: Icon(Icons.star, color: AppColors.normalYellow, size: 14.sp),
            backgroundColor: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIncomingRequestBanner() {
    return InkWell(
      onTap: controller.goToJobDetails,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.onlineGreen.withAlpha(75)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.onlineGreen.withAlpha(50)),
              ),
              child: Icon(Icons.notifications_active_outlined, color: AppColors.onlineGreen, size: 24.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Request Incoming!",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "Pipe Leak Repair • 1.2 km away",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.greyText, size: 16.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Schedule",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          "See all",
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleList() {
    return Obx(() => Column(
      children: controller.scheduleItems.map((item) => InkWell(
        onTap: controller.goToJobDetails,
        child: ScheduleCard(
          serviceTitle: item['title']!,
          clientName: item['client']!,
          time: item['time']!,
          distance: item['distance']!,
          price: item['price']!,
          duration: item['duration']!,
          status: item['status']!,
        ),
      )).toList(),
    ));
  }

  Widget _buildWeeklySummaryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "This Week",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          "Details",
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklySummaryCards() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryItem("💰", "\$425", "Earnings"),
          _buildSummaryItem("✅", "8", "Jobs Done"),
          _buildSummaryItem("⭐", "4.9★", "Avg Rating"),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: TextStyle(fontSize: 24.sp)),
        SizedBox(height: 8.h),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }
}
