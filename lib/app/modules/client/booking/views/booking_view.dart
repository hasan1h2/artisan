import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/components/custom_stepper.dart';
import '../../../../core/components/fixed_bottom_action_bar.dart';
import '../../../../core/components/selectable_date_card.dart';
import '../../../../core/components/selectable_time_chip.dart';
import '../../../../core/components/address_selection_card.dart';
import '../../../../core/components/summary_detail_tile.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.booking.tr,
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
          onPressed: controller.previousStep,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => CustomStepper(currentStep: controller.currentStep.value)),
          ),
          Expanded(
            child: Obx(() {
              switch (controller.currentStep.value) {
                case 1:
                  return _buildDateAndTimeStep();
                case 2:
                  return _buildAddressStep();
                case 3:
                  return _buildNotesStep();
                case 4:
                  return _buildSummaryStep();
                default:
                  return const SizedBox.shrink();
              }
            }),
          ),
          Obx(() => FixedBottomActionBar(
                buttonText: controller.currentStep.value == 4
                    ? AppStrings.confirmBooking.tr
                    : AppStrings.continueBtn.tr,
                onPressed: controller.nextStep,
              )),
        ],
      ),
    );
  }

  Widget _buildDateAndTimeStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: AppColors.primary, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      AppStrings.selectDate.tr,
                      style: GoogleFonts.poppins(
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Row(
                        children: List.generate(controller.dates.length, (index) {
                          final date = controller.dates[index];
                          return SelectableDateCard(
                            day: date['day']!,
                            date: date['date']!,
                            month: date['month']!,
                            isSelected: controller.selectedDateIndex.value == index,
                            onTap: () => controller.selectedDateIndex.value = index,
                          );
                        }),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, color: AppColors.primary, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      AppStrings.selectTime.tr,
                      style: GoogleFonts.poppins(
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: controller.times.length,
                      itemBuilder: (context, index) {
                        return Obx(() => SelectableTimeChip(
                          time: controller.times[index],
                          isSelected: controller.selectedTimeIndex.value == index,
                          onTap: () => controller.selectedTimeIndex.value = index,
                        ));
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.serviceAddress.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Stack(
              children: [
                // Lines to simulate map streets
                Positioned.fill(
                  child: CustomPaint(
                    painter: MapLinesPainter(),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2.w),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withAlpha(50),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Icon(Icons.location_on, color: AppColors.white, size: 20.w),
                      ),
                      Container(
                        width: 2.w,
                        height: 14.h,
                        color: AppColors.primary.withAlpha(80),
                      ),
                      Text(
                        'New York, NY',
                        style: GoogleFonts.poppins(
                          color: AppColors.primary.withAlpha(150),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  left: 12.w,
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.primary, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.useCurrentLocation.tr,
                        style: GoogleFonts.poppins(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
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
            AppStrings.savedAddresses.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(() => Column(
                children: List.generate(controller.addresses.length, (index) {
                  final address = controller.addresses[index];
                  return AddressSelectionCard(
                    title: address['title'] as String,
                    address: address['address'] as String,
                    isDefault: address['isDefault'] as bool,
                    isSelected: controller.selectedAddressIndex.value == index,
                    onTap: () => controller.selectedAddressIndex.value = index,
                  );
                }),
              )),
          SizedBox(height: 8.h),
          // Add new address button dotted
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.primary.withAlpha(100), style: BorderStyle.none),
            ),
            child: CustomPaint(
              painter: DashedBorderPainter(color: AppColors.primary.withAlpha(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(20),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: AppColors.primary, size: 16.w),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    AppStrings.addNewAddress.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNotesStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.additionalNotes.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            AppStrings.addNotesHint.tr,
            style: GoogleFonts.poppins(
              color: AppColors.greyText,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.border),
            ),
            child: TextField(
              controller: controller.notesController,
              maxLines: 6,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Describe your issue, specific requirements, or any other details that would help the artisan...',
                hintStyle: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
                border: InputBorder.none,
                counterText: '', // hide default counter
              ),
              style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(() => Text(
                  '${controller.notesLength}/500 characters',
                  style: GoogleFonts.poppins(
                    color: AppColors.greyText,
                    fontSize: 12.sp,
                  ),
                )),
          ),
          SizedBox(height: 24.h),
          Text(
            AppStrings.quickAdd.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: controller.quickNotes.map((note) => GestureDetector(
                  onTap: () => controller.addQuickNote(note),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(20),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.primary.withAlpha(50)),
                    ),
                    child: Text(
                      note,
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.bookingSummary.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'James Wilson',
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Plumbing Expert',
                        style: GoogleFonts.poppins(
                          color: AppColors.greyText,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.ratingStar, size: 14.w),
                          SizedBox(width: 4.w),
                          Text(
                            '4.9',
                            style: GoogleFonts.poppins(
                              color: AppColors.textColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.check_circle_outline, color: AppColors.statusCompletedText, size: 24.w),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SummaryDetailTile(
            icon: Icons.calendar_today_outlined,
            title: 'Date',
            value: 'Tue, Apr 14',
          ),
          SummaryDetailTile(
            icon: Icons.access_time,
            title: 'Time',
            value: '10:00 AM',
          ),
          SummaryDetailTile(
            icon: Icons.location_on_outlined,
            title: 'Address',
            value: '123 Main Street, Apt 4B, New York, ...',
          ),
          SummaryDetailTile(
            icon: Icons.description_outlined,
            title: 'Notes',
            value: controller.notesController.text.isEmpty ? 'No additional notes' : controller.notesController.text,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(10), // Extracted slightly blueish background
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.serviceFee.tr,
                      style: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
                    ),
                    Text(
                      '\$65.00',
                      style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.platformFee.tr,
                      style: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
                    ),
                    Text(
                      '\$5.00',
                      style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(color: AppColors.border),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.estimatedTotal.tr,
                      style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '\$70.00',
                      style: GoogleFonts.poppins(color: AppColors.statusCompletedText, fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Simple painters for custom shapes
class DashedBorderPainter extends CustomPainter {
  final Color color;
  DashedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(16.r)));
    
    // Simplistic dash effect representation using pathMetrics (often requires external libs, but we can draw basic rects)
    // For exact dashed border, usually package 'dotted_border' is used. I'll just draw a solid border fallback if strict dash is tough in pure canvas, but here is a simple line dash.
    Path dashPath = Path();
    var metrics = path.computeMetrics();
    for (var m in metrics) {
      double distance = 0.0;
      while (distance < m.length) {
        dashPath.addPath(m.extractPath(distance, distance + 5), Offset.zero);
        distance += 10;
      }
    }
    
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MapLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6.w
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(Offset(0, size.height * 0.6), Offset(size.width, size.height * 0.6), paint);
    canvas.drawLine(Offset(size.width * 0.4, 0), Offset(size.width * 0.4, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
