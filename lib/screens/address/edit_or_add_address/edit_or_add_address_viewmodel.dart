import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditOrAddAddressViewModel extends GetxController {

  /// Global Key and Controllers
  TextEditingController labelController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  TextEditingController streetNumController = TextEditingController();
  TextEditingController laneController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController nearbyLandmarkController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late bool isAdd;
  Map<String, dynamic>? args;

  @override
  void onInit() {
    args = Get.arguments;
    if(args == null) {
      isAdd = false;
    } else {
      if(args!.containsKey('isAdd')) {
        isAdd = args!['isAdd'];
      }
      else {
        isAdd = false;
      }
    }
    super.onInit();
  }


  @override
  void onClose() {
    disposeVariables();
    super.onClose();
  }

  disposeVariables() {
    labelController.dispose();
    houseNumController.dispose();
    streetNumController.dispose();
    laneController.dispose();
    areaController.dispose();
    cityController.dispose();
    buildingNameController.dispose();
    nearbyLandmarkController.dispose();
    numberController.dispose();
    noteController.dispose();
    // formKey.currentState!.reset();
  }
}