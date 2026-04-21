import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

class WorkerJobDetailsController extends GetxController {
  final checklist = <Map<String, dynamic>>[
    {'title': 'Arrive at location', 'checked': true},
    {'title': 'Greet client & inspect issue', 'checked': true},
    {'title': 'Complete the repair', 'checked': false},
    {'title': 'Clean up workspace', 'checked': false},
    {'title': 'Get client signature', 'checked': false},
  ].obs;

  void toggleCheck(int index) {
    checklist[index]['checked'] = !checklist[index]['checked'];
    checklist.refresh();
  }

  void navigateToJob() {
    // Logic to open map
  }

  void callClient() {
    // Logic to call
  }

  void chatClient() {
    Get.toNamed(Routes.WORKER_CHAT);
  }

  void reportIssue() {
    // Logic to report
  }
}

