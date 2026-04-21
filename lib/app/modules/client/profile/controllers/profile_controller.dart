import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import 'package:artisan/app/core/constants/static/app_images.dart';
import '../../../../core/constants/static/app_strings.dart';

class ProfileController extends GetxController {
  final userName = 'Alex Thompson'.obs;
  final userEmail = 'alex.thompson@email.com'.obs;
  final userPhone = '+1 (555) 234-5678'.obs;

  final stats = {
    'bookings': 4,
    'reviews': 3,
    'rating': 4.8,
  }.obs;

  final menuItems = [
    {
      'title': AppStrings.orderHistory.tr,
      'subtitle': '4 completed bookings',
      'icon': AppImages.menuOrders,
      'color': const Color(0xFF6C63FF),
    },
    {
      'title': AppStrings.savedAddresses.tr,
      'subtitle': '2 addresses saved',
      'icon': AppImages.menuLocation,
      'color': const Color(0xFF9C27B0),
    },
    {
      'title': AppStrings.paymentMethods.tr,
      'subtitle': 'Visa **** 4242',
      'icon': AppImages.menuCard,
      'color': const Color(0xFF4CAF50),
    },
    {
      'title': AppStrings.notifications.tr,
      'subtitle': 'All notifications on',
      'icon': AppImages.menuBell,
      'color': const Color(0xFFFFC107),
    },
    {
      'title': AppStrings.privacySecurity.tr,
      'subtitle': '2FA enabled',
      'icon': AppImages.menuShield,
      'color': const Color(0xFF2196F3),
    },
    {
      'title': AppStrings.helpSupport.tr,
      'subtitle': 'FAQ, contact us',
      'icon': AppImages.menuHelp,
      'color': const Color(0xFF9E9E9E),
    },
  ].obs;

  final recentBookings = <Map<String, dynamic>>[
    {
      'title': 'Pipe Leak Repair',
      'date': 'Apr 7, 2026',
      'price': '\$100',
      'status': AppStrings.completed.tr,
      'image': AppImages.servicePlaceholder,
    },
    {
      'title': 'Deep House Cleaning',
      'date': 'Mar 22, 2026',
      'price': '\$85',
      'status': AppStrings.completed.tr,
      'image': AppImages.servicePlaceholder,
    },
    {
      'title': 'Electrical Wiring',
      'date': 'Mar 10, 2026',
      'price': '\$160',
      'status': AppStrings.completed.tr,
      'image': AppImages.servicePlaceholder,
    },
  ].obs;

  void signOut() {
    Get.offAllNamed(Routes.LOGIN);
  }
}

