import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/confirmation/confirmation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final ConfirmationViewModel viewModel = Get.put<ConfirmationViewModel>(ConfirmationViewModel());

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      lang_key.orderConfirmed.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: viewModel.textSize.value * viewModel.animationValue.value
                      ),
                    ),
                  ),
                  Obx(() => AnimatedContainer(
                    duration: Duration(seconds: viewModel.animationController.duration!.inSeconds),
                      curve: Curves.elasticOut,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: (viewModel.containerHeightAndWidth.value * viewModel.animationValue.value) * 100,
                      height: (viewModel.containerHeightAndWidth.value * viewModel.animationValue.value) * 100,
                      child: const Image(image: Svg('assets/vectors/order_confirmed.svg')),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                    onTap: () {},
                    text: lang_key.cont.tr,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}