import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../views/rating_view.dart';

class PaymentSuccessController extends GetxController {
  final RxInt rating = 0.obs;
  final RxBool isReviewSubmitted = false.obs;
  final TextEditingController reviewController = TextEditingController();

  void backToHome() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void downloadReceipt() {
    // Generate and download PDF
  }

  void rateNow() {
    Get.to(() => const RatingView(), fullscreenDialog: true);
  }

  void submitReview() {
    if (rating.value == 0) {
      Get.snackbar('Oops', 'Please provide a star rating.');
      return;
    }
    isReviewSubmitted.value = true;
  }
}
