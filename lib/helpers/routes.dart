import 'package:adawat_customer_app/screens/about_us/about_us_view.dart';
import 'package:adawat_customer_app/screens/address/address_listing/address_listing_view.dart';
import 'package:adawat_customer_app/screens/address/edit_or_add_address/edit_or_add_address_view.dart';
import 'package:adawat_customer_app/screens/auth/email_login/email_login_view.dart';
import 'package:adawat_customer_app/screens/auth/login_options/login_options_view.dart';
import 'package:adawat_customer_app/screens/auth/otp_verification/otp_verification_view.dart';
import 'package:adawat_customer_app/screens/auth/sign_up/screen_one/screen_one_view.dart';
import 'package:adawat_customer_app/screens/bank_card/add_bank_card/add_bank_card_view.dart';
import 'package:adawat_customer_app/screens/bank_card/bank_card_listing/bank_card_listing_view.dart';
import 'package:adawat_customer_app/screens/bottom_appbar/bottom_appbar_view.dart';
import 'package:adawat_customer_app/screens/categories_listing/categories_listing_view.dart';
import 'package:adawat_customer_app/screens/category_services_list/category_services_list_view.dart';
import 'package:adawat_customer_app/screens/change_password/change_password_view.dart';
import 'package:adawat_customer_app/screens/change_phone_number/change_phone_number_view.dart';
import 'package:adawat_customer_app/screens/chat/chat_view.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/cart/cart_view.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/confirm_address/confirm_address_view.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/confirmation/confirmation_view.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/payment_method/payment_method_view.dart';
import 'package:adawat_customer_app/screens/language/language_view.dart';
import 'package:adawat_customer_app/screens/profile_settings/profile_settings_view.dart';
import 'package:adawat_customer_app/screens/service_details/service_details_view.dart';
import 'package:adawat_customer_app/screens/single_booking/single_booking_view.dart';
import 'package:adawat_customer_app/screens/support/support_view.dart';
import 'package:adawat_customer_app/screens/terms_&_conditions/terms_and_conditions_view.dart';
import 'package:get/get.dart';
import '../screens/auth/sign_up/screen_three/screen_three_view.dart';
import '../screens/auth/sign_up/screen_two/screen_two_view.dart';
import '../screens/popular_services/popular_services_view.dart';

class AppRoutes {

  static const initRoute = '/';
  static const loginWithEmail = '/loginWithEmail';
  static const signUpScreenOne = '/signUpScreenOne';
  static const signUpScreenTwo = '/signUpScreenTwo';
  static const signUpScreenThree = '/signUpScreenThree';
  static const otpVerification = '/otpVerification';
  static const bottomBar = '/bottomBar';
  static const cart = '/cart';
  static const confirmAddress = '/confirmAddress';
  static const paymentMethod = '/paymentMethod';
  static const orderConfirmation = '/orderConfirmation';
  static const categoriesListing = '/categoriesListing';
  static const categoryServicesList = '/categoryServicesList';
  static const popularServices = '/popularServices';
  static const chat = '/chat';
  static const personalDetails = '/personalDetails';
  static const addressListing = '/addressListing';
  static const bankCardsListing = '/bankCardsListing';
  static const changePassword = '/changePassword';
  static const changePhoneNumber = '/changePhoneNumber';
  static const language = '/language';
  static const support = '/support';
  static const aboutUs = '/aboutUs';
  static const termsAndConditions = '/termsAndConditions';
  static const editOrAddAddress = '/editOrAddAddress';
  static const addBankCard = '/addBankCard';
  static const serviceDetails = '/serviceDetails';
  static const bookingDetails = '/bookingDetails';

  static final pages = [
    GetPage(name: initRoute, page: () => LoginOptionsView()),
    GetPage(name: loginWithEmail, page: () => EmailLoginView()),
    GetPage(name: signUpScreenOne, page: () => ScreenOneView()),
    GetPage(name: signUpScreenTwo, page: () => ScreenTwoView()),
    GetPage(name: signUpScreenThree, page: () => ScreenThreeView()),
    GetPage(name: otpVerification, page: () => OtpVerificationView()),
    GetPage(name: cart, page: () => CartView()),
    GetPage(name: confirmAddress, page: () => ConfirmAddressView()),
    GetPage(name: paymentMethod, page: () => PaymentMethodView()),
    GetPage(name: orderConfirmation, page: () => const ConfirmationView()),
    GetPage(name: bottomBar, page: () => const BottomAppbarView()),
    GetPage(name: categoriesListing, page: () => CategoriesListingView()),
    GetPage(name: categoryServicesList, page: () => const CategoryServicesListView()),
    GetPage(name: popularServices, page: () => PopularServicesView()),
    GetPage(name: chat, page: () => ChatView()),
    GetPage(name: personalDetails, page: () => PersonalDetailsView()),
    GetPage(name: addressListing, page: () => AddressListingView()),
    GetPage(name: editOrAddAddress, page: () => EditOrAddAddressView()),
    GetPage(name: bankCardsListing, page: () => const BankCardListingView()),
    GetPage(name: changePassword, page: () => const ChangePasswordView()),
    GetPage(name: changePhoneNumber, page: () => const ChangePhoneNumberView()),
    GetPage(name: language, page: () => const LanguageView()),
    GetPage(name: support, page: () => const SupportView()),
    GetPage(name: aboutUs, page: () => const AboutUsView()),
    GetPage(name: termsAndConditions, page: () => const TermsAndConditionsView()),
    GetPage(name: addBankCard, page: () => AddBankCardView()),
    GetPage(name: serviceDetails, page: () => ServiceDetailsView()),
    GetPage(name: bookingDetails, page: () => const SingleBookingView()),
  ];
}