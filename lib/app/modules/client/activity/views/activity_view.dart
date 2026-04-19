import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/components/order_history_card.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ActivityController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.orderHistory.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: _buildSearchBar(),
            ),
            SizedBox(height: 16.h),
            _buildFilters(),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() {
                final filtered = controller.filteredOrders;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final order = filtered[index];
                    return OrderHistoryCard(
                      title: order['title'],
                      artisanName: order['artisanName'],
                      date: order['date'],
                      price: order['price'],
                      status: order['status'],
                      imagePath: order['image'],
                      onRate: () {},
                      onRebook: () {},
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(10),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.greyText, size: 20.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              AppStrings.searchOrders.tr,
              style: GoogleFonts.poppins(
                color: AppColors.greyText,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: controller.filters.map((filter) {
          final isSelected = filter == controller.selectedFilter.value;
          final count = controller.getFilterCount(filter);
          
          return GestureDetector(
            onTap: () => controller.changeFilter(filter),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: isSelected ? Border.all(color: AppColors.primary) : Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Text(
                    filter,
                    style: GoogleFonts.poppins(
                      color: isSelected ? AppColors.white : AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  if (count > 0 && !isSelected) ...[
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(15), // distinct gray
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        '$count',
                        style: GoogleFonts.poppins(
                          color: AppColors.greyText,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ] else if (count > 0 && isSelected) ...[
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.white.withAlpha(50),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        '$count',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ));
  }
}
