import 'package:get/get.dart';

class AppStrings extends Translations {
  // Page 1
  static const findTrustedHelp = 'Find Skilled Artisans Near You';
  static const findTrustedHelpSub = 'Browse trusted professionals for plumbing, electrical work, repairs, and more — all in one place.';

  // Page 2
  static const trackService = 'Track Your Service in Real-Time';
  static const trackServiceSub = 'Stay updated with live location tracking and know exactly when your artisan will arrive.';

  // Page 3
  static const securePayments = 'Hassle-Free & Secure Payments';
  static const securePaymentsSub = 'Pay safely through the app with multiple payment options and complete transparency.';

  // Buttons
  static const next = 'Next';
  static const getStarted = 'Get Started';

  // Login Strings
  static const welcomeBack = 'Welcome Back !';
  static const signInSub = 'Sign in with your email and password\nor social media to continue';
  static const email = 'Email';
  static const password = 'Password';
  static const rememberMe = 'Remember me';
  static const forgotPassword = 'Forgot password ?';
  static const signIn = 'Sign in';
  static const or = 'Or';
  static const dontHaveAccount = 'Don\'t have account?';
  static const signUp = 'Sign up';

  // Role Strings
  static const whichDoYouWantToList = 'Which do you want to list?';
  static const roleSelectionSub = 'Tell us how you want to use FixGo';
  static const iNeedHelp = 'I need help';
  static const iNeedHelpSub = 'Find and book trusted professionals\nfor your home needs';
  static const iWantToWork = 'I want to work';
  static const iWantToWorkSub = 'Join our platform and connect with\nclients in your area';

  // Sign Up Strings
  static const registerAccount = 'Register Account';
  static const fullName = 'Full Name';
  static const number = 'Number';
  static const confirmPassword = 'Confirm Password';
  static const agreeWithTerms = 'Agree with terms and privacy';
  static const alreadyHaveAccount = 'Already have an account?';

  // Forgot Password Strings
  static const forgotPasswordTitle = 'Forgot Password';
  static const forgotPasswordSub = 'Don\'t worry, please enter your email and we will send you a reset link';
  static const sendCode = 'Send Code';

  // Verification Strings
  static const verification = 'Verification';
  static const verifyYourEmail = 'Verify your Email';
  static const enterVerificationCode = 'Enter Verification Code';
  static const weSendCodeTo = 'Please enter 6 digit verification that have been sent to your email address'; // modified to match image phrase loosely or exact from prompt, wait prompt says "We send code to example@gmail.com. Please enter it", I'll use the prompt version but pass dynamic email.
  static const resendCode = 'Resend code';
  static const dontReceiveCode = 'Don\'t receive code ?';
  static const verify = 'Verify';

  // Reset Password Strings
  static const resetPassword = 'Reset Password';
  static const createNewPassword = 'Create New Password'; // Image 1 title
  static const createNewPasswordSub = 'Create your new password so you can login to your account'; // Prompt sub. Image actually says "Please enter a new password to change", let's use prompt one.
  static const newPassword = 'New Password';
  static const submit = 'Submit';
  static const changePassword = 'Change Password';
  static const createPassword = 'Create Password';

  // Success Strings
  static const success = 'Success!';
  static const successSub = 'You password has been changed. Please log in again with a new password.';
  static const continueBtn = 'Continue';

  // Phase 3 Strings
  static const seeAll = 'See all';
  static const searchService = 'Search for service by name';
  static const searchOrders = 'Search orders...';
  // Home
  static const letLocalExperts = 'Let Local Experts Help';
  static const you = 'You'; // Used for colored "You" in the banner
  static const forYou = 'For You';
  static const popularServices = 'Popular Services';
  static const recommendedArtisans = 'Recommended Artisans';
  static const verified = 'VERIFIED';
  static const perHr = '/hr';
  static const promoTitle = 'First Service 20% Off!';
  static const promoCode = 'Use code: FIXGO20 at checkout';
  static const claim = 'Claim';
  // Services
  static const ourAllServices = 'Our All Services';
  static const goAnywhere = 'Go anywhere, get any services.';
  static const repairMaintenance = 'Repair & Maintenance';
  static const cleaning = 'Cleaning';
  static const installation = 'Installation';
  static const homeImprovement = 'Home Improvement';
  static const movingShifting = 'Moving & Shifting';
  static const gardenCleaning = 'Garden cleaning';
  // Activity
  static const orderHistory = 'Order History';
  static const all = 'All';
  static const completed = 'Completed';
  static const cancelled = 'Cancelled';
  static const upcoming = 'Upcoming';
  static const rate = 'Rate';
  static const rebook = 'Rebook';
  static const by = 'by ';
  // Profile
  static const myProfile = 'My Profile';
  static const bookings = 'Bookings';
  static const reviews = 'Reviews';
  static const ratingGiven = 'Rating Given';
  static const recentBookings = 'Recent Bookings';
  static const signOut = 'Sign Out';
  static const savedAddresses = 'Saved Addresses';
  static const paymentMethods = 'Payment Methods';
  static const notifications = 'Notifications';
  static const privacySecurity = 'Privacy & Security';
  static const helpSupport = 'Help & Support';

  // Phase 4 Strings
  static const serviceDetails = 'Service Details';
  static const overview = 'Overview';
  static const whatsIncluded = 'What\'s Included';
  static const topArtisanForThis = 'Top Artisan for This';
  static const bookNow = 'Book Now';
  static const booking = 'Booking';
  static const dateTime = 'Date & Time'; // For stepper
  static const address = 'Address'; // For stepper
  static const notes = 'Notes'; // For stepper
  static const confirm = 'Confirm'; // For stepper
  static const selectDate = 'Select Date';
  static const selectTime = 'Select Time';
  static const serviceAddress = 'Service Address';
  static const useCurrentLocation = 'Use Current Location';
  static const addNewAddress = 'Add New Address';
  static const additionalNotes = 'Additional Notes';
  static const addNotesHint = 'Help the artisan understand your needs better';
  static const quickAdd = 'Quick Add';
  static const bookingSummary = 'Booking Summary';
  static const serviceFee = 'Service fee';
  static const platformFee = 'Platform fee';
  static const estimatedTotal = 'Estimated Total';
  static const confirmBooking = 'Confirm Booking';
  static const popular = 'POPULAR';
  static const startingFrom = 'Starting from';
  static const insured = 'Insured';
  static const hr1 = '1 hr';
  static const view = 'View';

  // Phase 5 Strings
  static const onlineOnTheWay = 'Online · On the way';
  static const jobInProgress = 'Job in Progress';
  static const rateAfterService = 'Rate after service completion';
  static const track = 'Track ->';
  static const writeMessage = 'write your message...';
  static const findingArtisan = 'Finding Artisan';
  static const findingBestArtisan = 'Finding the best artisan for you...';
  static const searchingNearby = 'Searching nearby artisans...';
  static const checkingAvailability = 'Checking availability...';
  static const matchingRequirements = 'Matching your requirements...';
  static const artisanFoundConfirming = 'Artisan found! Confirming...';
  static const trackArtisan = 'Track Artisan';
  static const arrivingIn = 'Arriving in 12 min';
  static const eta = 'ETA:';
  static const tracking = 'Tracking';
  static const serviceInProgress = 'Service In Progress';
  static const statusTimeline = 'Status Timeline';
  static const bookingConfirmed = 'Booking Confirmed';
  static const onTheWay = 'On the Way';
  static const working = 'Working';
  static const estimatedCost = 'Estimated Cost';
  static const jobStart = 'Job Start';
  static const viewCompletionWork = 'View Completion work';
  static const live = 'Live';

  // Phase 6 Strings
  static const payment = 'Payment';
  static const workOverview = 'Work Overview';
  static const serviceCompletedSuccess = 'Service Completed Successfully!';
  static const workCompleted = 'Work Completed';
  static const photos = 'Photos';
  static const costBreakdown = 'Cost Breakdown';
  static const promoDiscount = 'Promo Discount';
  static const totalDue = 'Total Due';
  static const serviceGuarantee = '90-Day Service Guarantee';
  static const sign = 'Sign';
  static const goToPay = 'Go to pay';
  static const securePaymentPortal = 'Secure payment portal';
  static const secured = 'Secured';
  static const totalAmountDue = 'Total Amount Due';
  static const cardDetails = 'Card Details';
  static const cardholderName = 'Cardholder name';
  static const branchName = 'Branch name';
  static const paymentSuccessful = 'Payment Successful!';
  static const transactionId = 'Transaction ID';
  static const amountPaid = 'Amount Paid';
  static const howWasExperience = 'How was your experience?';
  static const rateNow = 'Rate Now';
  static const downloadReceipt = 'Download Receipt';
  static const backToHome = 'Back to Home';
  static const editProfile = 'Edit Profile';
  static const saveChanges = 'Save Changes';
  static const labor = 'Labor';
  static const parts = 'Parts';
  static const platformFeePercent = 'Platform fee (5%)';
  static const total = 'Total';
  static const cardNo = '4242 4242 4242 4242';
  static const expiry = '12/28';
  static const cvv = '***';
  static const paymentMsg = 'Your payment of %s has been processed successfully.';

  // Worker Role Strings
  static const earnings = 'Earnings';
  static const totalEarned = 'Total Earned';
  static const jobsDoneStatus = 'Jobs Done';
  static const avgJob = 'Avg/Job';
  static const dailyEarnings = 'Daily Earnings';
  static const nextPayoutLocal = 'Next Payout: %s';
  static const processingInDays = 'Processing in %s days';
  static const recentTransactions = 'Recent Transactions';
  static const jobCompletion = 'Job Completion';
  static const getClientSignature = 'Get client signature to complete';
  static const workCompletedLocal = 'Work Completed';
  static const clientSignatureLocal = 'Client Signature';
  static const clientSignsHere = 'Client signs here';
  static const confirmComplete = 'Confirm & Complete';
  static const incomingRequests = 'Incoming Requests';
  static const activeRequestsCount = '%s active requests';
  static const urgentTag = 'URGENT';
  static const normalTag = 'NORMAL';
  static const accept = 'Accept';
  static const decline = 'Decline';
  static const call = 'Call';
  static const chat = 'Chat';
  static const verifiedArtisan = 'VERIFIED ARTISAN';
  static const skillsServices = 'Skills & Services';
  static const serviceArea = 'Service Area';
  static const performance = 'Performance';
  static const accountSettings = 'Account Settings';
  static const topArtisanInArea = 'Top 5% in your area';
  static const jobAlerts = 'Job alerts, payment updates';
  static const welcomeBackName = 'Welcome back,';
  static const youAreOnline = 'You are Online';
  static const receivingNewRequests = 'Receiving new requests';
  static const todaysEarnings = 'Today\'s Earnings';
  static const todaysJobs = 'Today\'s Jobs';
  static const newRequestIncoming = 'New Request Incoming!';
  static const todaysSchedule = 'Today\'s Schedule';
  static const thisWeek = 'This Week';
  static const avgRating = 'Avg Rating';
  static const reportAnIssue = 'Report an Issue';
  static const problemWithThisJob = 'Problem with this job?';
  static const jobDetailsTitle = 'Job Details';
  static const jobChecklistTitle = 'Job Checklist';
  static const jobLocationTitle = 'Job Location';
  static const navigate = 'Navigate';
  static const arriveAtLocation = 'Arrive at location';
  static const greetClient = 'Greet client & inspect issue';
  static const cleanUpWorkspace = 'Clean up workspace';

  // Account Verification
  static const accountVerification = 'Account Verification';
  static const documentVerification = 'Document verification';
  static const selectDocumentType = 'Select Document type';
  static const idCard = 'ID Card';
  static const passport = 'Passport';
  static const provideIdInfo = 'Please provide your ID Card information';
  static const dob = 'Date of birth';
  static const idNumber = 'ID number';
  static const takeBothSidePictures = 'Take both side pictures of your government issued ID card';
  static const placeIdInFrame = 'Place the ID Card in the frame';
  static const verificationSuccess = 'Verification Success';
  static const verificationSuccessfullyCompleted = 'Your ID card verification is successfully Completed';
  static const verificationFailed = 'Verification Failed';
  static const pleaseTryAgainLater = 'Please try again later';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          findTrustedHelp: findTrustedHelp,
          findTrustedHelpSub: findTrustedHelpSub,
          trackService: trackService,
          trackServiceSub: trackServiceSub,
          securePayments: securePayments,
          securePaymentsSub: securePaymentsSub,
          next: next,
          getStarted: getStarted,
          welcomeBack: welcomeBack,
          signInSub: signInSub,
          email: email,
          password: password,
          rememberMe: rememberMe,
          forgotPassword: forgotPassword,
          signIn: signIn,
          or: or,
          dontHaveAccount: dontHaveAccount,
          signUp: signUp,
          whichDoYouWantToList: whichDoYouWantToList,
          roleSelectionSub: roleSelectionSub,
          iNeedHelp: iNeedHelp,
          iNeedHelpSub: iNeedHelpSub,
          iWantToWork: iWantToWork,
          iWantToWorkSub: iWantToWorkSub,
          registerAccount: registerAccount,
          fullName: fullName,
          number: number,
          confirmPassword: confirmPassword,
          agreeWithTerms: agreeWithTerms,
          alreadyHaveAccount: alreadyHaveAccount,
          forgotPasswordTitle: forgotPasswordTitle,
          forgotPasswordSub: forgotPasswordSub,
          sendCode: sendCode,
          verification: verification,
          verifyYourEmail: verifyYourEmail,
          enterVerificationCode: enterVerificationCode,
          weSendCodeTo: weSendCodeTo,
          resendCode: resendCode,
          dontReceiveCode: dontReceiveCode,
          verify: verify,
          resetPassword: resetPassword,
          createNewPassword: createNewPassword,
          createNewPasswordSub: createNewPasswordSub,
          newPassword: newPassword,
          submit: submit,
          changePassword: changePassword,
          createPassword: createPassword,
          success: success,
          successSub: successSub,
          continueBtn: continueBtn,
          seeAll: seeAll,
          searchService: searchService,
          searchOrders: searchOrders,
          letLocalExperts: letLocalExperts,
          you: you,
          forYou: forYou,
          popularServices: popularServices,
          recommendedArtisans: recommendedArtisans,
          verified: verified,
          perHr: perHr,
          promoTitle: promoTitle,
          promoCode: promoCode,
          claim: claim,
          ourAllServices: ourAllServices,
          goAnywhere: goAnywhere,
          repairMaintenance: repairMaintenance,
          cleaning: cleaning,
          installation: installation,
          homeImprovement: homeImprovement,
          movingShifting: movingShifting,
          gardenCleaning: gardenCleaning,
          orderHistory: orderHistory,
          all: all,
          completed: completed,
          cancelled: cancelled,
          upcoming: upcoming,
          rate: rate,
          rebook: rebook,
          by: by,
          myProfile: myProfile,
          bookings: bookings,
          reviews: reviews,
          ratingGiven: ratingGiven,
          recentBookings: recentBookings,
          signOut: signOut,
          savedAddresses: savedAddresses,
          paymentMethods: paymentMethods,
          notifications: notifications,
          privacySecurity: privacySecurity,
          helpSupport: helpSupport,
          serviceDetails: serviceDetails,
          overview: overview,
          whatsIncluded: whatsIncluded,
          topArtisanForThis: topArtisanForThis,
          bookNow: bookNow,
          booking: booking,
          dateTime: dateTime,
          address: address,
          notes: notes,
          confirm: confirm,
          selectDate: selectDate,
          selectTime: selectTime,
          serviceAddress: serviceAddress,
          useCurrentLocation: useCurrentLocation,
          addNewAddress: addNewAddress,
          additionalNotes: additionalNotes,
          addNotesHint: addNotesHint,
          quickAdd: quickAdd,
          bookingSummary: bookingSummary,
          serviceFee: serviceFee,
          platformFee: platformFee,
          estimatedTotal: estimatedTotal,
          confirmBooking: confirmBooking,
          popular: popular,
          startingFrom: startingFrom,
          insured: insured,
          hr1: hr1,
          view: view,
          onlineOnTheWay: onlineOnTheWay,
          jobInProgress: jobInProgress,
          rateAfterService: rateAfterService,
          track: track,
          writeMessage: writeMessage,
          findingArtisan: findingArtisan,
          findingBestArtisan: findingBestArtisan,
          searchingNearby: searchingNearby,
          checkingAvailability: checkingAvailability,
          matchingRequirements: matchingRequirements,
          artisanFoundConfirming: artisanFoundConfirming,
          trackArtisan: trackArtisan,
          arrivingIn: arrivingIn,
          eta: eta,
          tracking: tracking,
          serviceInProgress: serviceInProgress,
          statusTimeline: statusTimeline,
          bookingConfirmed: bookingConfirmed,
          onTheWay: onTheWay,
          working: working,
          estimatedCost: estimatedCost,
          jobStart: jobStart,
          viewCompletionWork: viewCompletionWork,
          live: live,
          payment: payment,
          workOverview: workOverview,
          serviceCompletedSuccess: serviceCompletedSuccess,
          workCompleted: workCompleted,
          photos: photos,
          costBreakdown: costBreakdown,
          promoDiscount: promoDiscount,
          totalDue: totalDue,
          serviceGuarantee: serviceGuarantee,
          sign: sign,
          goToPay: goToPay,
          securePaymentPortal: securePaymentPortal,
          secured: secured,
          totalAmountDue: totalAmountDue,
          cardDetails: cardDetails,
          cardholderName: cardholderName,
          branchName: branchName,
          paymentSuccessful: paymentSuccessful,
          transactionId: transactionId,
          amountPaid: amountPaid,
          howWasExperience: howWasExperience,
          rateNow: rateNow,
          downloadReceipt: downloadReceipt,
          backToHome: backToHome,
          editProfile: editProfile,
          saveChanges: saveChanges,
          labor: labor,
          parts: parts,
          platformFeePercent: platformFeePercent,
          total: total,
          cardNo: cardNo,
          expiry: expiry,
          cvv: cvv,
          paymentMsg: paymentMsg,
          earnings: 'Earnings',
          totalEarned: 'Total Earned',
          jobsDoneStatus: 'Jobs Done',
          avgJob: 'Avg/Job',
          dailyEarnings: 'Daily Earnings',
          nextPayoutLocal: 'Next Payout: %s',
          processingInDays: 'Processing in %s days',
          recentTransactions: 'Recent Transactions',
          jobCompletion: 'Job Completion',
          getClientSignature: 'Get client signature to complete',
          clientSignatureLocal: 'Client Signature',
          clientSignsHere: 'Client signs here',
          confirmComplete: 'Confirm & Complete',
          incomingRequests: 'Incoming Requests',
          activeRequestsCount: '%s active requests',
          urgentTag: 'URGENT',
          normalTag: 'NORMAL',
          accept: 'Accept',
          decline: 'Decline',
          call: 'Call',
          chat: 'Chat',
          verifiedArtisan: 'VERIFIED ARTISAN',
          skillsServices: 'Skills & Services',
          serviceArea: 'Service Area',
          performance: 'Performance',
          accountSettings: 'Account Settings',
          topArtisanInArea: 'Top 5% in your area',
          jobAlerts: 'Job alerts, payment updates',
          welcomeBackName: 'Welcome back,',
          youAreOnline: 'You are Online',
          receivingNewRequests: 'Receiving new requests',
          todaysEarnings: 'Today\'s Earnings',
          todaysJobs: 'Today\'s Jobs',
          newRequestIncoming: 'New Request Incoming!',
          todaysSchedule: 'Today\'s Schedule',
          thisWeek: 'This Week',
          avgRating: 'Avg Rating',
          reportAnIssue: 'Report an Issue',
          problemWithThisJob: 'Problem with this job?',
          jobDetailsTitle: 'Job Details',
          jobChecklistTitle: 'Job Checklist',
          jobLocationTitle: 'Job Location',
          navigate: 'Navigate',
          arriveAtLocation: 'Arrive at location',
          greetClient: 'Greet client & inspect issue',
          cleanUpWorkspace: cleanUpWorkspace,
          accountVerification: accountVerification,
          documentVerification: documentVerification,
          selectDocumentType: selectDocumentType,
          idCard: idCard,
          passport: passport,
          provideIdInfo: provideIdInfo,
          dob: dob,
          idNumber: idNumber,
          takeBothSidePictures: takeBothSidePictures,
          placeIdInFrame: placeIdInFrame,
          verificationSuccess: verificationSuccess,
          verificationSuccessfullyCompleted: verificationSuccessfullyCompleted,
          verificationFailed: verificationFailed,
          pleaseTryAgainLater: pleaseTryAgainLater,
        }
      };
}
