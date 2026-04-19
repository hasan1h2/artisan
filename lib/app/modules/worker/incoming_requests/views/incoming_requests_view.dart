import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/components/request_card.dart';
import '../controllers/incoming_requests_controller.dart';

class IncomingRequestsView extends GetView<IncomingRequestsController> {
  const IncomingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IncomingRequestsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Incoming Requests",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: AppColors.urgentRed,
              shape: BoxShape.circle,
            ),
            child: Text(
              "2",
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVerificationWarning(),
              SizedBox(height: 24.h),
              Obx(() => Column(
                children: List.generate(controller.requests.length, (index) {
                  final req = controller.requests[index];
                  return RequestCard(
                    clientName: req['clientName']!,
                    serviceTitle: req['serviceTitle']!,
                    address: req['address']!,
                    distance: req['distance']!,
                    time: req['time']!,
                    price: req['price']!,
                    tag: req['tag']!,
                    onAccept: () => controller.acceptRequest(index),
                    onDecline: () => controller.declineRequest(index),
                    onCall: () {},
                    onChat: () {},
                  );
                }),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationWarning() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
           Container(
             padding: EdgeInsets.all(8.r),
             decoration: const BoxDecoration(
               color: AppColors.white,
               shape: BoxShape.circle,
             ),
             child: const Icon(Icons.error_outline, color: AppColors.urgentRed),
           ),
           SizedBox(height: 12.h),
           Text(
             "Your account isn't verified yet. To send work requests and get hired, please complete your verification.",
             textAlign: TextAlign.center,
             style: GoogleFonts.inter(
               fontSize: 13.sp,
               color: AppColors.textColor,
             ),
           ),
           SizedBox(height: 16.h),
           SizedBox(
             width: double.infinity,
             child: ElevatedButton(
               onPressed: () => Get.toNamed(Routes.WORKER_VERIFICATION),
               style: ElevatedButton.styleFrom(
                 backgroundColor: AppColors.primary,
                 foregroundColor: AppColors.white,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
               ),
               child: const Text("Verify now"),
             ),
           ),
        ],
      ),
    );
  }
}
