import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/components/custom_chat_bubble.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          color: AppColors.primary,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.h, left: 16.w, right: 16.w, bottom: 16.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.white.withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18.w),
                ),
              ),
              SizedBox(width: 16.w),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.asset(
                      AppImages.placeholderAvatar,
                      width: 44.w,
                      height: 44.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        color: AppColors.statusCompletedText,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2.w),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'James Wilson',
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Container(
                          width: 6.w,
                          height: 6.w,
                          decoration: const BoxDecoration(
                            color: AppColors.statusCompletedText,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          AppStrings.onlineOnTheWay.tr,
                          style: GoogleFonts.poppins(
                            color: AppColors.white.withAlpha(200),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTopBanner(),
          SizedBox(height: 16.h),
          _buildDateDivider(),
          SizedBox(height: 16.h),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  // Simple check: show avatar if it's the first message from artisan or previous was from me
                  bool showAvatar = false;
                  if (!msg['isMe']) {
                    if (index == 0) {
                      showAvatar = true;
                    } else if (controller.messages[index - 1]['isMe'] == true) {
                      showAvatar = true;
                    }
                  }
                  
                  return CustomChatBubble(
                    message: msg['text'],
                    time: msg['time'],
                    isMe: msg['isMe'],
                    showAvatar: showAvatar,
                  );
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildTopBanner() {
    return GestureDetector(
      onTap: controller.trackJob,
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary.withAlpha(30)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.star, color: AppColors.primary, size: 28.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.jobInProgress.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    AppStrings.rateAfterService.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Track ', // using string but handling arrow specifically
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.arrow_forward, color: AppColors.primary, size: 16.w),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColors.border)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Today, April 7',
              style: GoogleFonts.poppins(
                color: AppColors.greyText,
                fontSize: 12.sp,
              ),
            ),
          ),
          Expanded(child: Divider(color: AppColors.border)),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(10), // Light blue tint
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: AppStrings.writeMessage.tr,
                    hintStyle: GoogleFonts.poppins(color: AppColors.greyText.withAlpha(150), fontSize: 14.sp),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.poppins(color: AppColors.textColor, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: controller.sendMessage,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.send, color: AppColors.white, size: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
