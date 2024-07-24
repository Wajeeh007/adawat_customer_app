import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ConfirmationViewModel extends GetxController with GetTickerProviderStateMixin{

  late AnimationController animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late Animation<double> animationValue = CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

  RxDouble containerHeightAndWidth = 3.0.obs;
  RxDouble textSize = 3.0.obs;

  @override
  void onReady() {
    animationController.forward();
    animationController.addListener(() {
      containerHeightAndWidth.value = 3 * (animationValue.value * 100);
      textSize.value = 32 * animationValue.value;
      if(animationController.isCompleted) {
        animationController.dispose();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    containerHeightAndWidth.value = 3;
    textSize.value = 3;
    super.onClose();
  }
}