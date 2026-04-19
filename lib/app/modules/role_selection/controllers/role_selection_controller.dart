import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class RoleSelectionController extends GetxController {
  final selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
    Get.offAllNamed(Routes.LOGIN);
    // Implement auto-navigation or further logic here
  }
}
