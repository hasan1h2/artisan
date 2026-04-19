import 'package:get/get.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/onboarding/views/onboarding_view.dart';
import '../../modules/auth/login/views/login_view.dart';
import '../../modules/auth/login/controllers/login_controller.dart';
import '../../modules/role_selection/views/role_selection_view.dart';
import '../../modules/role_selection/controllers/role_selection_controller.dart';
import '../../modules/auth/sign_up/views/sign_up_view.dart';
import '../../modules/auth/sign_up/controllers/sign_up_controller.dart';
import '../../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../../modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import '../../modules/auth/verification/views/verification_view.dart';
import '../../modules/auth/verification/controllers/verification_controller.dart';
import '../../modules/auth/reset_password/views/reset_password_view.dart';
import '../../modules/auth/reset_password/controllers/reset_password_controller.dart';
import '../../modules/auth/reset_password/views/reset_success_view.dart';
import '../../modules/dashboard/views/dashboard_view.dart';
import '../../modules/dashboard/controllers/dashboard_controller.dart';
import '../../modules/client/service_details/views/service_details_view.dart';
import '../../modules/client/service_details/controllers/service_details_controller.dart';
import '../../modules/client/booking/views/booking_view.dart';
import '../../modules/client/booking/controllers/booking_controller.dart';
import '../../modules/client/chat/views/chat_view.dart';
import '../../modules/client/chat/controllers/chat_controller.dart';
import '../../modules/client/finding_artisan/views/finding_artisan_view.dart';
import '../../modules/client/finding_artisan/controllers/finding_artisan_controller.dart';
import '../../modules/client/tracking/views/tracking_view.dart';
import '../../modules/client/tracking/controllers/tracking_controller.dart';
import '../../modules/client/work_overview/views/work_overview_view.dart';
import '../../modules/client/work_overview/controllers/work_overview_controller.dart';
import '../../modules/client/payment/views/payment_view.dart';
import '../../modules/client/payment/controllers/payment_controller.dart';
import '../../modules/client/payment_success/views/payment_success_view.dart';
import '../../modules/client/payment_success/controllers/payment_success_controller.dart';
import '../../modules/client/edit_profile/views/edit_profile_view.dart';
import '../../modules/client/edit_profile/controllers/edit_profile_controller.dart';
import '../../modules/client/help_support/views/help_support_view.dart';
import '../../modules/client/help_support/controllers/help_support_controller.dart';
import './app_routes.dart';

import '../../modules/worker/job_completion/views/job_completion_view.dart';
import '../../modules/worker/job_completion/controllers/job_completion_controller.dart';
import '../../modules/worker/chat/views/worker_chat_view.dart';
import '../../modules/worker/chat/controllers/worker_chat_controller.dart';
import '../../modules/worker/job_details/views/worker_job_details_view.dart';
import '../../modules/worker/job_details/controllers/worker_job_details_controller.dart';
import '../../modules/worker/verification/views/worker_verification_view.dart';
import '../../modules/worker/verification/controllers/worker_verification_controller.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: Routes.ROLE_SELECTION,
      page: () => const RoleSelectionView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RoleSelectionController>(() => RoleSelectionController());
      }),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
      }),
    ),
    GetPage(
      name: Routes.VERIFICATION,
      page: () => const VerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<VerificationController>(() => VerificationController());
      }),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
      }),
    ),
    GetPage(
      name: Routes.SUCCESS,
      page: () => const ResetSuccessView(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DashboardController>(() => DashboardController());
      }),
    ),
    GetPage(
      name: Routes.SERVICE_DETAILS,
      page: () => const ServiceDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ServiceDetailsController>(() => ServiceDetailsController());
      }),
    ),
    GetPage(
      name: Routes.BOOKING,
      page: () => const BookingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BookingController>(() => BookingController());
      }),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatController>(() => ChatController());
      }),
    ),
    GetPage(
      name: Routes.FINDING_ARTISAN,
      page: () => const FindingArtisanView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<FindingArtisanController>(() => FindingArtisanController());
      }),
    ),
    GetPage(
      name: Routes.TRACKING,
      page: () => const TrackingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<TrackingController>(() => TrackingController());
      }),
    ),
    GetPage(
      name: Routes.WORK_OVERVIEW,
      page: () => const WorkOverviewView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WorkOverviewController>(() => WorkOverviewController());
      }),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => const PaymentView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PaymentController>(() => PaymentController());
      }),
    ),
    GetPage(
      name: Routes.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PaymentSuccessController>(() => PaymentSuccessController());
      }),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<EditProfileController>(() => EditProfileController());
      }),
    ),
    GetPage(
      name: Routes.HELP_SUPPORT,
      page: () => const HelpSupportView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HelpSupportController>(() => HelpSupportController());
      }),
    ),
    GetPage(
      name: Routes.JOB_COMPLETION,
      page: () => const JobCompletionView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<JobCompletionController>(() => JobCompletionController());
      }),
    ),
    GetPage(
      name: Routes.WORKER_CHAT,
      page: () => const WorkerChatView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WorkerChatController>(() => WorkerChatController());
      }),
    ),
    GetPage(
      name: Routes.WORKER_JOB_DETAILS,
      page: () => const WorkerJobDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WorkerJobDetailsController>(() => WorkerJobDetailsController());
      }),
    ),
    GetPage(
      name: Routes.WORKER_VERIFICATION,
      page: () => const WorkerVerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WorkerVerificationController>(() => WorkerVerificationController());
      }),
    ),
  ];
}
