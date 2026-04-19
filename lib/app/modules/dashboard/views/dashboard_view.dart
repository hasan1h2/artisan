import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/components/custom_bottom_nav_bar.dart';
import '../../activity/views/activity_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../services/views/services_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Explicitly initialize controller here to prevent crashes if route bindings are bypassed
    Get.put(DashboardController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          HomeView(),
          ServicesView(),
          ActivityView(),
          ProfileView(),
        ],
      )),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
      )),
    );
  }
}
