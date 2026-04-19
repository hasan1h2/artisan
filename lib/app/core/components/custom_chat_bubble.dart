import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_images.dart';

class CustomChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;
  final bool isRead;
  final bool showAvatar;

  const CustomChatBubble({
    super.key,
    required this.message,
    required this.time,
    this.isMe = false,
    this.isRead = true,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            Padding(
              padding: EdgeInsets.only(right: 8.w, bottom: 20.h),
              child: showAvatar
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        AppImages.placeholderAvatar,
                        width: 32.w,
                        height: 32.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(width: 32.w),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.chatBubbleSent : AppColors.chatBubbleReceived,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                      bottomLeft: isMe ? Radius.circular(20.r) : Radius.circular(4.r),
                      bottomRight: isMe ? Radius.circular(4.r) : Radius.circular(20.r),
                    ),
                    boxShadow: !isMe
                        ? [
                            BoxShadow(
                              color: Colors.black.withAlpha(5),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      color: isMe ? AppColors.white : AppColors.textColor,
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: GoogleFonts.poppins(
                        color: AppColors.greyText.withAlpha(150),
                        fontSize: 10.sp,
                      ),
                    ),
                    if (isMe) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.done_all,
                        color: isRead ? AppColors.statusCompletedText : AppColors.greyText,
                        size: 14.w,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (isMe) SizedBox(width: 40.w), // To balance the layout visually if needed, though Flexible dictates width
        ],
      ),
    );
  }
}
