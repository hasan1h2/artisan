import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

class FindingArtisanController extends GetxController {
  final isFound = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate finding artisan process
    Future.delayed(const Duration(seconds: 4), () {
      isFound.value = true;
    });
  }

  void trackArtisan() {
    Get.offNamed(Routes.TRACKING);
  }
}
