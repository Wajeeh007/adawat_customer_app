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
      key.bookings: 'Bookings',
      key.inbox: 'Inbox',
      key.notifications: 'Notifications',
      key.settings: 'Settings',

      /// Home
      key.noCategoriesFound: 'No Categories Found',
      key.categories: 'Categories',
      key.specialOffers: 'Special Offers',
      key.popularServices: 'Popular Services',

      /// General
      key.cont: 'Continue',
      key.sar: 'SAR',
      key.bookNow: 'Book Now',
      key.register: 'Register',
      key.viewAll: 'View All',

      /// Error Messages
      key.enterValidPhoneNo: 'Enter Valid Phone Number',
      key.enterValidEmail: 'Enter Valid Email',
      key.fieldIsRequired: 'Field is Required',
      key.cardLength: 'Invalid Card No',
      key.cvcLength: 'Invalid CVC',
      key.passwordLength: 'Password must be 6 characters long',
      key.passwordNotMatching: 'Passwords do not match',
  };

}