import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBankCardViewModel extends GetxController {

  /// Global Key and Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onClose() {
    nameController.dispose();
    cardNumberController.dispose();
    cvcController.dispose();
    // formKey.currentState!.reset();
    super.onClose();
  }
}