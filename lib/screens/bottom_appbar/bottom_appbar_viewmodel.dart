import 'package:adawat_customer_app/screens/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarViewModel extends GetxController {

  PageController bottomNavBarController = PageController(initialPage: 0);

  String appbarTitle(int index) {
    switch(index) {
      case 0:
        return '';
      case 1:
        return 'Bookings';
      case 2:
        return 'Inbox';
      case 3:
        return 'Notifications';
      case 4:
        return 'Settings';
      default:
        return '';
    }
  }

  Widget selectView(int index) {
    switch (index) {
      case 0:
        return HomeView();
      default:
        return const SizedBox();
    }
  }

}