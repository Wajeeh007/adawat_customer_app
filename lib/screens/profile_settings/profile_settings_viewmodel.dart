import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileSettingsViewModel extends GetxController {

  /// Controllers and Global Key
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
  }
}