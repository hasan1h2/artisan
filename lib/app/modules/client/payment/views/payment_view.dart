import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.payment.tr,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPaymentHeader(),
                  SizedBox(height: 24.h),
                  _buildTotalDueCard(),
                  SizedBox(height: 16.h),
                  _buildCostSummary(),
                  SizedBox(height: 24.h),
                  _buildCardForm(),
                  SizedBox(height: 24.h),
                  _buildSecurityBadges(),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: ElevatedButton(
                onPressed: controller.processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Center(
                  child: Text(
                    AppStrings.continueBtn.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.payment.tr,
              style: GoogleFonts.poppins(
                color: AppColors.textColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Icon(Icons.lock_outline, color: AppColors.timelineActive, size: 16.w),
                SizedBox(width: 4.w),
                Text(
                  AppStrings.secured.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.timelineActive,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          AppStrings.securePaymentPortal.tr,
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalDueCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Text(
            AppStrings.totalAmountDue.tr,
            style: GoogleFonts.poppins(
              color: AppColors.white.withAlpha(180),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '\$100.00',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Job #FX-2024-0892 · Pipe Leak Repair',
            style: GoogleFonts.poppins(
              color: AppColors.white.withAlpha(150),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostSummary() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.costBreakdown.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          _buildSummaryRow('Service (Pipe Leak Repair)', '\$95.00'),
          SizedBox(height: 12.h),
          _buildSummaryRow(AppStrings.platformFee.tr, '\$5.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(color: AppColors.border),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.total.tr,
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$100.00',
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 14.sp),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildCardForm() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.cardDetails.tr,
            style: GoogleFonts.poppins(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          _buildInputField(AppStrings.cardholderName.tr, controller.cardholderNameController),
          SizedBox(height: 16.h),
          _buildInputField(AppStrings.cardNo.tr, controller.cardNumberController, icon: Icons.credit_card),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(child: _buildInputField('12/28', controller.expiryController)), // Image 2 placeholder
              SizedBox(width: 16.w),
              Expanded(child: _buildInputField('***', controller.cvvController)), // Image 2 placeholder
            ],
          ),
          SizedBox(height: 16.h),
          _buildInputField(AppStrings.branchName.tr, controller.branchNameController),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController ctr, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: ctr,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon, color: AppColors.greyText, size: 20.w) : null,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: AppColors.greyText.withAlpha(150), fontSize: 14.sp),
          border: InputBorder.none,
        ),
        style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildSecurityBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBadge(Icons.lock, 'SSL Secured'),
        SizedBox(width: 12.w),
        _buildBadge(Icons.verified_user, '256-bit Encryption'),
        SizedBox(width: 12.w),
        _buildBadge(Icons.check, 'PCI Compliant'),
      ],
    );
  }

  Widget _buildBadge(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyText.withAlpha(150), size: 12.w),
        SizedBox(width: 4.w),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.greyText.withAlpha(150),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
