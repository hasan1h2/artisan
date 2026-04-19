import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/components/status_timeline_tile.dart';
import '../../../../core/components/map_placeholder.dart';
import '../../../../core/components/artisan_bottom_sheet_card.dart';
import '../controllers/tracking_controller.dart';

class TrackingView extends GetView<TrackingController> {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Obx(() {
      if (!controller.isArrived.value) {
        return _buildMapState(context);
      } else {
        return _buildTimelineState(context);
      }
    });
  }

  Widget _buildTimelineState(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.tracking.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.back(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.timelineActive.withAlpha(20),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.timelineActive.withAlpha(50)),
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: AppColors.timelineActive,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    AppStrings.live.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.timelineActive,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildArtisanHeader(),
                  SizedBox(height: 16.h),
                  _buildProgressCircle(),
                  SizedBox(height: 16.h),
                  _buildTimeline(),
                  SizedBox(height: 16.h),
                  _buildServiceDetails(),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: ElevatedButton(
                onPressed: controller.viewCompletionWork,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.viewCompletionWork.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtisanHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            AppImages.placeholderAvatar,
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'James Wilson',
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.ratingStar, size: 14.w),
                  SizedBox(width: 4.w),
                  Text(
                    '4.9 · Plumbing Expert',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: controller.goToChat,
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(10),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 24.w),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCircle() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 120.w,
            height: 120.w,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 0.6,
                  strokeWidth: 8.w,
                  backgroundColor: AppColors.primary.withAlpha(20),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.timelineCurrent),
                  strokeCap: StrokeCap.round,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.build_circle_outlined, color: AppColors.timelineCurrent, size: 32.w),
                      SizedBox(height: 4.h),
                      Text(
                        '34 min',
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            AppStrings.serviceInProgress.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Started at 10:18 AM · 34 min elapsed',
            style: GoogleFonts.poppins(
              color: AppColors.greyText,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.statusTimeline.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24.h),
          const StatusTimelineTile(
            title: 'Booking Confirmed',
            subtitle: 'Your booking has been accepted',
            time: '09:45 AM',
            icon: Icons.check, // Using standard icon as placeholder for custom SVG
            state: TimelineState.completed,
          ),
          const StatusTimelineTile(
            title: 'On the Way',
            subtitle: 'Artisan is heading to your location',
            time: '10:00 AM',
            icon: Icons.check,
            state: TimelineState.completed,
          ),
          StatusTimelineTile(
            title: 'Working',
            subtitle: 'Service in progress at your location',
            time: '10:18 AM',
            icon: Icons.build,
            state: TimelineState.current,
            trailingWidget: Row(
              children: [
                Row(
                  children: List.generate(3, (index) => Container(
                    margin: EdgeInsets.only(right: 4.w),
                    width: 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      color: AppColors.timelineCurrent.withAlpha(100 + (index * 50)),
                      shape: BoxShape.circle,
                    ),
                  )),
                ),
                SizedBox(width: 8.w),
                Text(
                  'In progress...',
                  style: GoogleFonts.poppins(
                    color: AppColors.timelineCurrent,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const StatusTimelineTile(
            title: 'Completed',
            subtitle: 'Service has been completed',
            time: 'Pending',
            icon: Icons.celebration,
            state: TimelineState.pending,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetails() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.serviceDetails.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          _buildDetailRow('Service', 'Pipe Repair'),
          SizedBox(height: 12.h),
          _buildDetailRow('Location', '123 Main St, NY'),
          SizedBox(height: 12.h),
          _buildDetailRow(AppStrings.estimatedCost.tr, '\$65 - \$120'),
          SizedBox(height: 12.h),
          _buildDetailRow(AppStrings.jobStart.tr, '10:18 AM'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 14.sp,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildMapState(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ARTISAN IS ON THE WAY',
                          style: GoogleFonts.poppins(
                            color: AppColors.white.withAlpha(150),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: const BoxDecoration(
                                color: AppColors.statusCompletedText,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              AppStrings.arrivingIn.tr,
                              style: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.white),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          MapPlaceholder(
             child: Stack(
                children: [
                  Positioned(
                    top: 100.h,
                    left: 50.w,
                    child: CustomPaint(
                      size: Size(150.w, 150.w),
                      painter: RouteLinePainter(),
                    ),
                  ),
                  Positioned(
                    top: 250.h,
                    left: 140.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.w,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: AppColors.primary.withAlpha(50), blurRadius: 10)
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22.r),
                            child: Image.asset(AppImages.placeholderAvatar, fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: 2.w,
                          height: 12.h,
                          color: AppColors.primary,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            '12 min',
                            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 10.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150.h,
                    right: 80.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.redAccent.withAlpha(50), blurRadius: 10)],
                          ),
                          child: Icon(Icons.home, color: AppColors.white, size: 16.w),
                        ),
                        Container(
                          width: 2.w,
                          height: 12.h,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ],
             ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ArtisanBottomSheetCard(
              headerWidget: Container(
                 width: double.infinity,
                 padding: EdgeInsets.symmetric(vertical: 12.h),
                 decoration: BoxDecoration(
                   color: AppColors.statusCompletedText.withAlpha(20),
                   borderRadius: BorderRadius.circular(8.r),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.near_me_outlined, color: AppColors.statusCompletedText, size: 18.w),
                     SizedBox(width: 8.w),
                     Text(
                       'ETA: 12 minutes · 1.2 km away',
                       style: GoogleFonts.poppins(color: AppColors.statusCompletedText, fontSize: 12.sp, fontWeight: FontWeight.w600),
                     ),
                   ],
                 ),
              ),
              avatarPath: AppImages.placeholderAvatar,
              name: 'Marcus Johnson',
              badgeText: AppStrings.verified.tr,
              details: 'Plumber · Pipe Leak Repair',
              ratingValue: '4.9 (127 jobs)',
              actionWidget: const SizedBox.shrink(),
              trailingIcon: Row(
                children: [
                  GestureDetector(
                    onTap: controller.toggleState, // Added toggle for testing
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.timelineCurrent.withAlpha(10),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.timelineCurrent.withAlpha(20)),
                      ),
                      child: Icon(Icons.arrow_forward_ios, color: AppColors.timelineCurrent, size: 24.w),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.goToChat,
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(10),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.primary.withAlpha(20)),
                      ),
                      child: Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 24.w),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class RouteLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4.w
      ..style = PaintingStyle.stroke;
    
    // Simulating a route line
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.5, 0);

    // Draw dotted line
    Path dashPath = Path();
    double dashWidth = 8.w;
    double dashSpace = 6.w;
    double distance = 0.0;
    
    for (var pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
