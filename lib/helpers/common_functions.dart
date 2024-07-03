import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

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

  static showErrorToast({
    required BuildContext context,
    required String desc,
    double height = 50,
}) {
    CherryToast.error(
      height: height,
      displayCloseButton: false,
      description: Text(
        desc,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      toastDuration: const Duration(milliseconds: 2300),
      backgroundColor: Get.isDarkMode ? primaryGrey : Colors.white,
      shadowColor: Get.isDarkMode ? primaryBlack : lightModeShadowGrey,
      toastPosition: Position.bottom,
      animationType: AnimationType.fromBottom,
    ).show(context);
  }

}