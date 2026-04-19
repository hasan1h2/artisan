import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

class ServiceDetailsController extends GetxController {
  final isFavorite = false.obs;
  final selectedTab = 'Overview'.obs;

  final whatsIncluded = [
    'Initial inspection & diagnosis',
    'All required parts & materials',
    'Professional installation',
    '90-day service guarantee',
  ];

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void bookNow() {
    Get.toNamed(Routes.BOOKING);
  }
}
