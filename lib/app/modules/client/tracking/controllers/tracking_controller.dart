import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

class TrackingController extends GetxController {
  final isArrived = false.obs;

  void toggleState() {
    isArrived.value = !isArrived.value;
  }

  void goToChat() {
    Get.toNamed(Routes.CHAT);
  }

  void viewCompletionWork() {
    Get.toNamed(Routes.WORK_OVERVIEW);
  }
}

