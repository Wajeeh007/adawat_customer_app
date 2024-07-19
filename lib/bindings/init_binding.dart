import 'package:adawat_customer_app/language_controller.dart';
import 'package:adawat_customer_app/screens/inbox/inbox_viewmodel.dart';
import 'package:adawat_customer_app/screens/notifications/notifications_viewmodel.dart';
import 'package:get/get.dart';
import '../screens/checkout_and_cart/cart/cart_viewmodel.dart';

LanguageController get initLanguageController {

  try {
    return Get.find();
  } catch (e) {
    Get.put(LanguageController(), permanent: true);
    return Get.find();
  }

}

class InitBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CartViewModel(), permanent: true);
    Get.put(NotificationsViewModel(), permanent: true);
    Get.put(InboxViewModel());
  }

}