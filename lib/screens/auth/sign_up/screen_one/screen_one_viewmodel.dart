import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class ScreenOneViewModel extends GetxController {

  /// GlobalKey(s) & Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Obscure Password Variables
  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;

  String? isPasswordMatching(String? value) {
    if(value != passwordController.text) {
      return lang_key.passwordNotMatching.tr;
    } else {
      return null;
    }
  }
}