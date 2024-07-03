import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsViewModel extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController = TabController(length: 3, vsync: this);

}