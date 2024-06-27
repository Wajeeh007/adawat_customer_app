import 'package:adawat_customer_app/language_controller.dart';
import 'package:get/get.dart';

LanguageController get initLanguageController {

  try {
    return Get.find();
  } catch (e) {
    Get.put(LanguageController(), permanent: true);
    return Get.find();
  }

}

// class InitBinding extends Bindings {
//
//
//
// }