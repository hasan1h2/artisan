import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../views/worker_image_view.dart';
import '../views/start_work_dialog.dart';

class WorkerJobDetailsController extends GetxController {
  // Client Info
  final clientName = "Alex Thompson".obs;
  final clientAddress = "142 Oak Street, Apt 5B".obs;
  final clientRating = 4.8.obs;
  final clientImage = "assets/images/home/Sarah Williams.png".obs; // Image 20 placeholder

  // Service Info
  final serviceName = "Pipe Leak Repair".obs;
  final paymentAmount = 75.00.obs;
  final bookingId = "#J1".obs;

  // Schedule & Location
  final scheduledTime = "April 8, 2026 at 10:00 AM".obs;
  final distance = "2.5 km away".obs;
  final arrivalTime = "12 min".obs;

  // Notes & Attachment
  final clientNotes = "Leaking pipe under the kitchen sink. Water pooling on floor. Needs urgent attention.".obs;
  final attachmentName = "Pipe leak Image".obs;
  final attachmentImage = "assets/images/pipe_leak.png".obs; // Assuming this based on user prompt Image (1).jpg

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

  void startNavigation() {
    Get.toNamed(Routes.WORKER_NAVIGATION);
  }

  void viewAttachment() {
    Get.to(() => WorkerImageView(imagePath: attachmentImage.value));
  }

  void callClient() {
    // Logic to call
  }

  void chatClient() {
    Get.toNamed(Routes.WORKER_CHAT);
  }

  void iveArrived() {
    Get.dialog(const StartWorkDialog());
  }

  void reportIssue() {
    Get.toNamed(Routes.REPORT_ISSUE);
  }

  void completeJob() {
    Get.toNamed(Routes.DASHBOARD);
  }

  void showCancellationDialog() {
    // This will be implemented in a separate widget or direct Get.dialog
  }

  void confirmCancellation() {
    Get.back(); // Close dialog
    Get.back(); // Go back from navigation
  }
}
