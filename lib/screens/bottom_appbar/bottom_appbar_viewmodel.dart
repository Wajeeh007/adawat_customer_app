import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class BottomAppbarViewModel extends GetxController {

  PageController bottomNavBarController = PageController(initialPage: 0);

  String appbarTitle(int index) {
    switch(index) {
      case 0:
        return '';
      case 1:
        return lang_key.bookings.tr;
      case 2:
        return lang_key.inbox.tr;
      case 3:
        return lang_key.notifications.tr;
      case 4:
        return lang_key.settings.tr;
      default:
        return '';
    }
  }
}