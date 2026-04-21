import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../controllers/earnings_controller.dart';

class EarningsView extends GetView<EarningsController> {
  const EarningsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EarningsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow(),
                  SizedBox(height: 24.0),
                  _buildDailyEarningsCard(),
                  SizedBox(height: 16.0),
                  _buildPayoutBanner(),
                  SizedBox(height: 24.0),
                  Text(
                    "Recent Transactions",
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  _buildTransactionsList(),
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
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.0, left: 10.0, right: 10.0, bottom: 20.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Earnings",
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                _buildFilterTab('Week'),
                _buildFilterTab('Month'),
                _buildFilterTab('Year'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    return Expanded(
      child: Obx(() {
        bool isSelected = controller.selectedFilter.value == label;
        return GestureDetector(
          onTap: () => controller.setFilter(label),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14.0,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColors.primary : Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStatsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
           _buildStat('ðŸ’°', '\$740', 'Total Earned', '+12%'),
           SizedBox(width: 12.0),
           _buildStat('âœ…', '18', 'Jobs Done', '+3'),
           SizedBox(width: 12.0),
           _buildStat('ðŸ“Š', '\$41', 'Avg/Job', '+5%'),
        ],
      ),
    );
  }

  Widget _buildStat(String icon, String value, String label, String trend) {
    return Container(
      width: 110.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C599D),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 8.0),
          Text(
            value,
            style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 10.0, color: Colors.white70),
          ),
          Text(
             "â† $trend",
             style: GoogleFonts.inter(fontSize: 10.0, color: AppColors.onlineGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyEarningsCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daily Earnings",
                style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$740 total",
                style: GoogleFonts.inter(fontSize: 14.0, fontWeight: FontWeight.w600, color: AppColors.primary),
              ),
            ],
          ),
          SizedBox(height: 24.0),
          SizedBox(
            height: 150.0,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 200,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        return Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            days[value.toInt()],
                            style: GoogleFonts.inter(fontSize: 10.0, color: AppColors.greyText),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _buildBarGroup(0, 85),
                  _buildBarGroup(1, 120),
                  _buildBarGroup(2, 65),
                  _buildBarGroup(3, 145),
                  _buildBarGroup(4, 95),
                  _buildBarGroup(5, 175, isSelected: true),
                  _buildBarGroup(6, 55),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               _buildDayAmount("\$85"),
               _buildDayAmount("\$120"),
               _buildDayAmount("\$65"),
               _buildDayAmount("\$145"),
               _buildDayAmount("\$95"),
               _buildDayAmount("\$175", isSelected: true),
               _buildDayAmount("\$55"),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y, {bool isSelected = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isSelected ? AppColors.primary : const Color(0xFFF1F4F8),
          width: 30.0,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ],
    );
  }

  Widget _buildDayAmount(String amount, {bool isSelected = false}) {
    return Text(
      amount,
      style: GoogleFonts.inter(
        fontSize: 10.0,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        color: isSelected ? AppColors.textColor : AppColors.greyText,
      ),
    );
  }

  Widget _buildPayoutBanner() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: const BoxDecoration(color: AppColors.onlineGreen, shape: BoxShape.circle),
            child: Icon(Icons.attach_money, color: AppColors.white, size: 24.0),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Next Payout: \$425.00",
                  style: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14.0, color: const Color(0xFF2E7D32).withAlpha(180)),
                    SizedBox(width: 4.0),
                    Text(
                      "Processing in 2 days",
                      style: GoogleFonts.inter(fontSize: 13.0, color: const Color(0xFF2E7D32).withAlpha(180)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Color(0xFF2E7D32), size: 16.0),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Obx(() => Column(
      children: controller.transactions.map((tx) => Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: const Color(0xFFF1F4F8), shape: BoxShape.circle),
              child: Icon(Icons.build_outlined, color: AppColors.primary, size: 20.0),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx['title']!,
                    style: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${tx['client']} â€¢ ${tx['time']}",
                    style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  tx['amount']!,
                  style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.onlineGreen),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(4.0)),
                  child: Text(
                    tx['status']!,
                    style: GoogleFonts.inter(fontSize: 10.0, fontWeight: FontWeight.bold, color: AppColors.onlineGreen),
                  ),
                ),
              ],
            ),
          ],
        ),
      )).toList(),
    ));
  }
}

