import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../../../core/routes/app_routes.dart';

class JobCompletionController extends GetxController {
  final signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: const Color(0xFF0F172A),
    exportBackgroundColor: Colors.white,
  );

  // Mock data matching Image 19
  final jobTitle = "Pipe Leak Repair".obs;
  final clientName = "Jennifer Martinez".obs;
  final jobDate = "Today".obs;
  final jobPrice = 75.00.obs;

  final checklist = <Map<String, dynamic>>[
    {'title': 'Pipe inspection & diagnosis', 'checked': true},
    {'title': 'PVC pipe replacement', 'checked': true},
    {'title': 'Sealant & waterproofing', 'checked': true},
    {'title': 'Area cleaned up', 'checked': true},
  ].obs;

  void toggleCheck(int index) {
    checklist[index]['checked'] = !checklist[index]['checked'];
    checklist.refresh();
  }

  void completeJob() {
    if (signatureController.isEmpty) {
      Get.snackbar(
        "Signature Required",
        "Please get the client's signature before completing the job.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }
    // Simulation
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close loading
      Get.offAllNamed(Routes.WORKER_ACTIVE_JOB); // Go back to dashboard or home
      Get.snackbar(
        "Job Completed",
        "The job has been successfully marked as complete.",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  @override
  void onClose() {
    signatureController.dispose();
    super.onClose();
  }
}
