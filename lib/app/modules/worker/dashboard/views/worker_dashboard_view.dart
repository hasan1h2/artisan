import 'package:flutter/material.dart';
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
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 20.0),
                   _buildStatsRow(),
                   SizedBox(height: 20.0),
                   _buildIncomingRequestBanner(),
                   SizedBox(height: 24.0),
                   _buildScheduleHeader(),
                   SizedBox(height: 12.0),
                   _buildScheduleList(),
                   SizedBox(height: 24.0),
                   _buildWeeklySummaryHeader(),
                   SizedBox(height: 12.0),
                   _buildWeeklySummaryCards(),
                   SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20.0, left: 20.0, right: 20.0, bottom: 30.0),
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
                radius: 25.0,
                backgroundColor: Colors.white24,
                backgroundImage: const AssetImage(AppImages.placeholderAvatar),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      "Marcus Johnson",
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: Badge(
                  alignment: Alignment.topRight,
                  backgroundColor: AppColors.urgentRed,
                  child: Icon(Icons.notifications_none, color: Colors.white, size: 24.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              children: [
                Row(
                   children: [
                     Container(
                       width: 10.0,
                       height: 10.0,
                       decoration: const BoxDecoration(
                         color: AppColors.onlineGreen,
                         shape: BoxShape.circle,
                       ),
                     ),
                     SizedBox(width: 8.0),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "You are Online",
                           style: GoogleFonts.poppins(
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         Text(
                           "Receiving new requests",
                           style: GoogleFonts.inter(
                             fontSize: 12.0,
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
        SizedBox(width: 16.0),
        Expanded(
          child: WorkerStatCard(
            title: "Today's Jobs",
            value: "2",
            subtitle: "Rating: 4.9",
            subtitleColor: AppColors.normalYellow,
            icon: Icon(Icons.star, color: AppColors.normalYellow, size: 14.0),
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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.onlineGreen.withAlpha(75)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.onlineGreen.withAlpha(50)),
              ),
              child: Icon(Icons.notifications_active_outlined, color: AppColors.onlineGreen, size: 24.0),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Request Incoming!",
                    style: GoogleFonts.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "Pipe Leak Repair â€¢ 1.2 km away",
                    style: GoogleFonts.inter(
                      fontSize: 13.0,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.greyText, size: 16.0),
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
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          "See all",
          style: GoogleFonts.inter(
            fontSize: 14.0,
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
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          "Details",
          style: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklySummaryCards() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryItem("ðŸ’°", "\$425", "Earnings"),
          _buildSummaryItem("âœ…", "8", "Jobs Done"),
          _buildSummaryItem("â­", "4.9â˜…", "Avg Rating"),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: TextStyle(fontSize: 24.0)),
        SizedBox(height: 8.0),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.0,
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }
}

