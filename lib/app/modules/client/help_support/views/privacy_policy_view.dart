import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/static/app_colors.dart';
import '../controllers/help_support_controller.dart';

class PrivacyPolicyView extends GetView<HelpSupportController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: UnconstrainedBox(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(left: 16.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.socialButtonBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: AppColors.textColor, size: 16.w),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                children: [
                  _buildPolicyItem(
                    '1. Information We Collect',
                    '• Account Info — Name, email address, and password.\n• Assessment Responses — Your EQ competency ratings and reassessment results.\n• Journal & Reflections — Written responses submitted during daily practice.\n• Usage & Progress Data — Practice streaks, completed exercises, and app activity.\n• Device Info — Device type, OS version, and app version for technical support.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '2. How We Use Your Information',
                    'To create and manage your account.\nTo personalize your journey recommendations based on assessment results.\nTo track your progress, streaks, and milestone achievements.\nTo send practice reminders and notifications at your chosen times.\nTo improve app features, fix bugs, and enhance the overall experience.\nTo power AI Copilot responses based on your inputs.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '3. How We Use Your Information',
                    '• We do not sell your personal data to any third party.\n• Trusted service providers (hosting, analytics, notifications) access data only as needed to operate the app.\n• If you access EQi30 through a coaching program, the program administrator may see aggregated progress data — never your private journal entries.\n• Data may be disclosed if required by law or to protect user safety.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '4. Data Storage and Security',
                    '• Your data is stored on secure, encrypted cloud servers.\n• All data in transit is protected using HTTPS/TLS encryption.\n• If you delete your account, all personal data is permanently removed within 30 days.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '5. Your Rights',
                    '• Access — Request a copy of your data anytime.\n• Correction — Update your profile directly from app settings.\n• Deletion — Delete your account via Profile -> Settings -> Delete Account.\n• Opt-Out — Turn off notifications anytime from Profile -> Notification Settings.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '6. Children\'s Privacy',
                    'EQi30 is intended for users 18 and older. We do not knowingly collect data from anyone under 18.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '7. Changes to This Policy',
                    'We may update this policy periodically. Any significant changes will be communicated via in-app notification or email. Continued use of the app after updates means you accept the revised policy.',
                  ),
                  _buildDivider(),
                  _buildPolicyItem(
                    '8. Contact Us',
                    'For any privacy-related questions or requests:\n📧 privacy@eqi30.com   🌐 www.eqi30.com\nWe respond to all inquiries within 5 business days.',
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyItem(String title, String content) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        iconColor: AppColors.textColor,
        collapsedIconColor: AppColors.textColor,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        childrenPadding: EdgeInsets.only(bottom: 16.h),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              content,
              style: GoogleFonts.poppins(
                color: AppColors.greyText,
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: AppColors.border, height: 1);
  }
}
