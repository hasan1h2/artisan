import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/static/app_colors.dart';
import '../constants/static/app_strings.dart';

class ScheduleCard extends StatelessWidget {
  final String serviceTitle;
  final String clientName;
  final String time;
  final String distance;
  final String price;
  final String duration;
  final String status; // ONGOING, UPCOMING
  final String? iconPath;

  const ScheduleCard({
    super.key,
    required this.serviceTitle,
    required this.clientName,
    required this.time,
    required this.distance,
    required this.price,
    required this.duration,
    required this.status,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    bool isOngoing = status.toUpperCase() == 'ONGOING';

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: AppColors.socialButtonBg,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(Icons.build_outlined, color: AppColors.primary, size: 24.0),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          serviceTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: isOngoing ? const Color(0xFFE8EAF6) : const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            status,
                            style: GoogleFonts.inter(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: isOngoing ? AppColors.primary : AppColors.greyText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      clientName,
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    duration,
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Divider(color: AppColors.border, height: 1),
          SizedBox(height: 12.0),
          Row(
            children: [
              Icon(Icons.access_time, size: 16.0, color: AppColors.greyText),
              SizedBox(width: 4.0),
              Text(
                time,
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(width: 16.0),
              Icon(Icons.location_on_outlined, size: 16.0, color: AppColors.greyText),
              SizedBox(width: 4.0),
              Text(
                distance,
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

