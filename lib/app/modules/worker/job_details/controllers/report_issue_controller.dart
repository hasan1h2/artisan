import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/report_problem_dialog.dart';

class ReportIssueController extends GetxController {
  final issueTypeController = TextEditingController();
  final descriptionController = TextEditingController();
  
  final issueTypes = ["Broken Equipment", "Safety Concern", "Client Disagreement", "Schedule Conflict", "Other"].obs;
  final selectedIssueType = "".obs;
  
  final urgencyLevel = "Medium".obs; // Low, Medium, High
  
  final characterCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    descriptionController.addListener(() {
      characterCount.value = descriptionController.text.length;
    });
  }

  void setUrgency(String level) {
    urgencyLevel.value = level;
  }

  void selectIssue(String? value) {
    if (value != null) {
      selectedIssueType.value = value;
    }
  }

  void submitReport() {
    if (selectedIssueType.isEmpty) {
      Get.snackbar("Error", "Please select an issue type", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (descriptionController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please provide a description", backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    Get.dialog(
      ReportProblemDialog(
        onConfirm: () {
          Get.back(); // Close dialog
          _processSubmission();
        },
      ),
    );
  }

  void _processSubmission() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    
    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close loading
      Get.back(); // Go back from report screen
      Get.snackbar(
        "Report Submitted",
        "Your report has been sent to support for review.",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  @override
  void onClose() {
    descriptionController.dispose();
    issueTypeController.dispose();
    super.onClose();
  }
}
