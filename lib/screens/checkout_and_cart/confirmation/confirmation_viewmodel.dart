import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ConfirmationViewModel extends GetxController with GetTickerProviderStateMixin{

  late AnimationController animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late Animation<double> animationValue = CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

  RxDouble containerHeightAndWidth = 3.0.obs;
  RxDouble textSize = 32.0.obs;

  @override
  void onReady() {
    animationController.forward();
    animationController.addListener(() {
      animationValue.value;
      if(animationController.isCompleted) {
        animationController.dispose();
      }
    });
    super.onReady();
  }
}