import 'package:adawat_customer_app/screens/auth/email_login/email_login_view.dart';
import 'package:adawat_customer_app/screens/auth/login_options/login_options_view.dart';
import 'package:adawat_customer_app/screens/auth/sign_up/screen_one/screen_one_view.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const initRoute = '/';
  static const loginWithEmail = '/loginWithEmail';
  static const signUpScreenOne = '/signUpScreenOne';

  static final pages = [
      GetPage(name: initRoute, page: () => LoginOptionsView()),
      GetPage(name: loginWithEmail, page: () => EmailLoginView()),
    GetPage(name: signUpScreenOne, page: () => const ScreenOneView()),
    ];
}