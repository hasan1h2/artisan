import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_strings.dart';

class RequestCard extends StatelessWidget {
  final String clientName;
  final String serviceTitle;
  final String address;
  final String distance;
  final String time;
  final String price;
  final String tag; // URGENT, NORMAL
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onCall;
  final VoidCallback onChat;

  const RequestCard({
    super.key,
    required this.clientName,
    required this.serviceTitle,
    required this.address,
    required this.distance,
    required this.time,
    required this.price,
    required this.tag,
    required this.onAccept,
    required this.onDecline,
    required this.onCall,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    bool isUrgent = tag.toUpperCase() == 'URGENT';

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: isUrgent ? AppColors.urgentRed.withAlpha(50) : AppColors.border,
          width: isUrgent ? 1.5 : 1,
        ),
        boxShadow: [
          if (isUrgent)
            BoxShadow(
              color: AppColors.urgentRed.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: isUrgent ? AppColors.urgentRed : AppColors.normalYellow,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      isUrgent ? Icons.flash_on : Icons.access_time_filled,
                      color: AppColors.white,
                      size: 14.0,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.timer_outlined, size: 14.0, color: AppColors.greyText),
                  SizedBox(width: 4.0),
                  Text(
                    "0:40s",
                    style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundColor: AppColors.socialButtonBg,
                child: Icon(Icons.person, color: AppColors.greyText),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14.0, color: AppColors.normalYellow),
                        SizedBox(width: 4.0),
                        Text(
                          "4.8 Client Rating",
                          style: GoogleFonts.inter(fontSize: 12.0, color: AppColors.greyText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.socialButtonBg,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                _buildInfoRow(Icons.build_outlined, serviceTitle),
                SizedBox(height: 8.0),
                _buildInfoRow(Icons.location_on_outlined, address),
                SizedBox(height: 8.0),
                _buildInfoRow(Icons.access_time, "$distance away â€¢ $time drive"),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCall,
                  icon: Icon(Icons.call_outlined, size: 18.0),
                  label: Text(AppStrings.call.tr),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textColor,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onChat,
                  icon: Icon(Icons.chat_bubble_outline, size: 18.0),
                  label: Text(AppStrings.chat.tr),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textColor,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onDecline,
                  icon: const Icon(Icons.close),
                  label: Text(AppStrings.decline.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEBEE),
                    foregroundColor: AppColors.urgentRed,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: const Icon(Icons.check),
                  label: Text(AppStrings.accept.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.0, color: AppColors.greyText),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13.0,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}

