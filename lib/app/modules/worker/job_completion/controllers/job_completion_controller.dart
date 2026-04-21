import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class JobCompletionController extends GetxController {
  final signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: const Color(0xFF0B0B0B),
    exportBackgroundColor: Colors.transparent,
  );

  final checklist = [
    {'title': 'Pipe inspection & diagnosis', 'checked': true},
    {'title': 'PVC pipe replacement', 'checked': true},
    {'title': 'Sealant & waterproofing', 'checked': true},
    {'title': 'Area cleaned up', 'checked': true},
  ].obs;

  void toggleCheck(int index) {
    checklist[index]['checked'] = !(checklist[index]['checked'] as bool);
    checklist.refresh();
  }

  void completeJob() {
    // Logic to export signature and finish
  }

  @override
  void onClose() {
    signatureController.dispose();
    super.onClose();
  }
}

