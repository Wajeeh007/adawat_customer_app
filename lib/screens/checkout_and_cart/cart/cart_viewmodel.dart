import 'package:get/get.dart';

class CartViewModel extends GetxController {

  RxList<int> quantities = [1, 6, 2].obs;
  RxBool showGuider = true.obs;

}