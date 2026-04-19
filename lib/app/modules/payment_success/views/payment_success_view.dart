import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/components/transaction_receipt_card.dart';
import '../controllers/payment_success_controller.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentSuccessController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.paymentSuccessful.tr,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            _buildSuccessAnimation(),
            SizedBox(height: 32.h),
            _buildReceiptCard(),
            SizedBox(height: 24.h),
            _buildRatingPrompt(),
            SizedBox(height: 32.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessAnimation() {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: AppColors.statusCompletedBg,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: AppColors.statusCompletedText, size: 50.w),
        ),
        SizedBox(height: 24.h),
        Text(
          AppStrings.paymentSuccessful.tr,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '🥳',
          style: TextStyle(fontSize: 24.sp),
        ),
        SizedBox(height: 12.h),
        Text(
          AppStrings.paymentMsg.tr.replaceFirst('%s', '\$121.25'),
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildReceiptCard() {
    return TransactionReceiptCard(
      transactionId: 'TXN-2026-FX4821-7283',
      details: {
        'Service': 'Pipe Repair',
        'Artisan': 'James Wilson',
        'Date': 'April 7, 2026',
        'Time': '10:18 AM – 11:54 AM',
        'Payment Method': 'Visa •••• 4242',
      },
      amountPaid: '\$121.25',
    );
  }

  Widget _buildRatingPrompt() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.ratingPromptBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.ratingStar.withAlpha(20)),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.ratingStar, size: 24.w),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.howWasExperience.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.ratingStar.withAlpha(150), // Brownish looking orange in image
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Rate James Wilson and the service',
                  style: GoogleFonts.poppins(
                    color: AppColors.ratingStar.withAlpha(150),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: controller.rateNow,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.ratingStar,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
            child: Text(
              AppStrings.rateNow.tr,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        OutlinedButton(
          onPressed: controller.downloadReceipt,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 56.h),
            side: BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.download, color: AppColors.primary, size: 20.w),
              SizedBox(width: 8.w),
              Text(
                AppStrings.downloadReceipt.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        ElevatedButton(
          onPressed: controller.backToHome,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(double.infinity, 56.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_outlined, color: AppColors.white, size: 20.w),
              SizedBox(width: 8.w),
              Text(
                AppStrings.backToHome.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
