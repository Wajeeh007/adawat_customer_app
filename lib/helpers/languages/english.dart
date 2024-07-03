import 'translations_key.dart' as key;

class English {

  Map<String, String> get translations => {
    ///Auth Screens
      /// Login Options Screen

      key.login: 'Login',
      key.or: 'Or',
      key.dontHaveAccount: 'Don\'t have an account? ',
      key.signUp: 'Sign Up',
      key.continueWithEmail: 'Continue With Email',

      /// Email Login Screen
      key.email: 'Email',
      key.password: 'Password',
      key.enterCredentials: 'Enter Credentials',

      /// Sign Up - Screen One
      key.fullName: 'Full Name',
      key.phoneNumber: 'Phone No',
      key.confirmPassword: 'Confirm Password',
      key.personalInfo: 'Personal Info',
      key.bank: 'Bank',
      key.address: 'Address',

      ///Sign Up - Scree Two
      key.houseOrApartment: 'House / Apartment No:',
      key.streetOrFloor: 'Street / Floor:',
      key.lane: 'Lane:',
      key.area: 'Area:',
      key.buildingName: 'Building Name:',
      key.nearbyLandmark: 'Nearby Landmark:',
      key.noteForServiceman: 'Note For Serviceman:',
      key.city: 'City',

      /// Sign Up - Screen Three
      key.cardHolderName: 'Cardholder Name:',
      key.cardNumber: 'Card Number:',
      key.cvcNumber: 'CVC:',
      key.skipAndSignUp: 'Skip & Sign Up',

      /// OTP Verification
      key.otpSent: 'An OTP has been sent on your phone number for verification.',
      key.verify: 'Verify',
      key.resendCode: 'Resend Code',

      /// Bottom Appbar
      key.welcome: 'Welcome',
      key.home: 'Home',
      key.booking: 'Booking',
      key.inbox: 'Inbox',
      key.notifications: 'Notification',
      key.settings: 'Settings',

      /// Home
      key.noCategoriesFound: 'No Categories Found',
      key.categories: 'Categories',
      key.specialOffers: 'Special Offers',
      key.popularServices: 'Popular Services',

      /// Service Details
      key.serviceDetails: 'Service Details',
      key.price: 'Price',
      key.duration: 'Duration',
      key.rating: 'Rating',
      key.discount: 'Discount',
      key.measuringUnit: 'Measuring Unit',
      key.reviews: 'Reviews',
      key.description: 'Description',
      key.serviceDesc: 'Service Description',
      key.serviceRev: 'Service Reviews',
      key.priceDetails: 'Price Details',
      key.selectServiceTime: 'Select Service Time',
      key.selectServiceDate: 'Select Service Date',

      /// Bookings Listing
      key.completed: 'Completed',
      key.cancelled: 'Cancelled',
      key.otherServices: 'Other Services: ',
      key.cancellationDate: 'Cancellation Date',
      key.viewEReceipt: 'View E-Receipt',
      key.addComments: 'Add comments ...',
      key.bookings: 'Bookings',

      /// Single Booking Details
      key.services: 'Services',
      key.bookingDetails: 'Booking Details',

      /// General
      key.cont: 'Continue',
      key.date: 'Date',
      key.pending: 'Pending',
      key.cancel: 'Cancel',
      key.sar: 'SAR',
      key.bookNow: 'Book Now',
      key.register: 'Register',
      key.quantity: 'Quantity',
      key.viewAll: 'View All',
      key.submit: 'Submit',

      /// Error Messages
      key.enterValidPhoneNo: 'Enter Valid Phone Number',
      key.enterValidEmail: 'Enter Valid Email',
      key.fieldIsRequired: 'Field is Required',
      key.cardLength: 'Invalid Card No',
      key.cvcLength: 'Invalid CVC',
      key.passwordLength: 'Password must be 6 characters long',
      key.selectDateError: 'Select date to proceed',
      key.selectTimeError: 'Select time to proceed',
      key.selectedTimeShort: 'Selected time should be 5 hours greater than current time',
      key.passwordNotMatching: 'Passwords do not match',
  };

}