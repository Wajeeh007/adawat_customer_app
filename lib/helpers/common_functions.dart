import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:get/get.dart';

class CommonFunctions {

  static String? validateEmail(String? value) {
    if (GetUtils.isBlank(value)!) {
      return lang_key.fieldIsRequired.tr;
    } else if (!GetUtils.isEmail(value!)) {
      return lang_key.enterValidEmail.tr;
    } else {
      return null;
    }
  }

  static String? validateDefaultField(String? value) {
    if (GetUtils.isBlank(value)!) {
      return lang_key.fieldIsRequired.tr;
    } else {
      return null;
    }
  }

}