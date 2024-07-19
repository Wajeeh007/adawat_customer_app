import 'package:adawat_customer_app/screens/bookings_listing/bookings_listing_view.dart';
import 'package:adawat_customer_app/screens/home/home_view.dart';
import 'package:adawat_customer_app/screens/inbox/inbox_view.dart';
import 'package:adawat_customer_app/screens/notifications/notifications_view.dart';
import 'package:adawat_customer_app/screens/settings/settings_view.dart';
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

  Widget selectView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const BookingsListingView();
      case 2:
        return const InboxView();
      case 3:
        return const NotificationsView();
      case 4:
        return const SettingsView();
      default:
        return const SizedBox();
    }
  }

}