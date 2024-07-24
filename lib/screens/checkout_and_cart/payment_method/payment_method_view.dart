import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_text_button.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/payment_method/card_extended_model.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/payment_method/payment_method_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:intl/intl.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../custom_widgets/or_text_and_line.dart';
import '../../../custom_widgets/price_text.dart';
import '../../../custom_widgets/stepper_text.dart';
import '../../../helpers/constants.dart';

class PaymentMethodView extends StatelessWidget {
  PaymentMethodView({super.key});

  final PaymentMethodViewModel viewModel = Get.put<PaymentMethodViewModel>(PaymentMethodViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.checkout.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth
                ),
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StepperText(
                            index: 2,
                            texts: [
                              lang_key.cart.tr,
                              lang_key.address.tr,
                              lang_key.payment.tr
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            lang_key.choosePaymentMethod.tr,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        ChooseCard(),
                      ],
                    ),
                  ),
                ),
              ),
              BottomBar()
            ],
          );
        }
      ),
    );
  }
}

/// Choose Card from list
class ChooseCard extends StatelessWidget {
  ChooseCard({super.key});

  final PaymentMethodViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: viewModel.cardsList.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if(index == viewModel.cardsList.length) {
            return Column(
              children: [
                if(viewModel.cardsList.length < 5) Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                      child: CustomTextButton(
                          onTap: () => Get.toNamed(AppRoutes.addBankCard),
                          text: lang_key.addCard.tr
                      ),
                  ),
                ),
                const OrTextAndLine(),
                CashOnDeliveryContainer(),
              ],
            );
          }
          return CardDetailsContainer(card: viewModel.cardsList[index]);
        }
    );
  }
}

/// Users Card(s) details widget for user to choose for payment
class CardDetailsContainer extends StatelessWidget {
  const CardDetailsContainer({super.key, required this.card});

  final CardExtendedModel card;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
          boxShadow: Get.isDarkMode ? null : kShadow,
          color: card.isSelected! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Image.asset(
              'assets/logos/${card.cardDetails!.networkName!.toLowerCase()}.png',
            height: 40,
            width: 60,
          ),
          const SizedBox(width: 15,),
          Expanded(
            flex: 5,
            child: DetailsTitleAndText(
                title: card.cardDetails!.networkName!,
                text: card.cardDetails!.cardNumber!
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: DetailsTitleAndText(
                  title: lang_key.expiry.tr,
                  text: DateFormat('MM/yy').format(card.cardDetails!.expiryDate!),
                crossAxisAlignment: CrossAxisAlignment.end,
              )
            ),
          )
        ],
      ),
    );
  }
}

/// Cost and prices details at the bottom
class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final PaymentMethodViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: kBorderRadius,
        boxShadow: Get.isDarkMode ? null : kShadow,
      ),
        duration: const Duration(milliseconds: 650),
        height: viewModel.bottomBarHeight.value,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: InkWell(
                onTap: () => viewModel.showPricing.value = !viewModel.showPricing.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      viewModel.showPricing.value ? lang_key.tapToCloseDetails.tr : lang_key.tapToShowCost.tr,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Icon(
                        viewModel.showPricing.value ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: viewModel.showPricing.value,
              child: Column(
                children: [
                  PromoCodeField(),
                  const CostSection(),
                ],
              ),
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: () => Get.offNamedUntil(AppRoutes.orderConfirmation, (route) => route.isFirst),
                    text: lang_key.completeOrder.tr,
                    margin: EdgeInsets.zero,
                    height: 45,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}

/// Widget for choosing cash on service completion
class CashOnDeliveryContainer extends StatelessWidget {
  CashOnDeliveryContainer({super.key});

  final PaymentMethodViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: Get.isDarkMode ? [] : kShadow,
          color: viewModel.isCashSelected.value ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: kBorderRadius
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/vectors/cash_on_delivery.png',
            height: 40,
            width: 60,
          ),
          const SizedBox(width: 15,),
          const DetailsTitleAndText(title: 'Cash', text: 'On Service Completion')
        ],
      ),
    ));
  }
}

/// Card details Title and Text
class DetailsTitleAndText extends StatelessWidget {
  const DetailsTitleAndText({
    super.key,
    required this.title,
    required this.text,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title, text;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 16
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}

/// TextField for Promo Code
class PromoCodeField extends StatelessWidget {
  PromoCodeField({super.key});

  final PaymentMethodViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: CustomTextField(
              title: lang_key.promoCode.tr,
              controller: viewModel.promoCodeController,
              padding: const EdgeInsets.only(top: 10),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            flex: 2,
            child: CustomButton(
              onTap: () {},
              text: lang_key.apply.tr,
              height: 49,
              textColor: backgroundWhite,
            ),
          )
        ],
      ),
    );
  }
}

/// Costs and discounts details
class CostSection extends StatelessWidget {
  const CostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleAndCost(title: lang_key.servicesPrice.tr, price: 300),
          TitleAndCost(title: lang_key.discount.tr, price: 0),
          TitleAndCost(title: lang_key.total.tr, price: 300)
        ],
      ),
    );
  }
}

/// Price section title and price widget
class TitleAndCost extends StatelessWidget {
  const TitleAndCost({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          PriceText(price: price)
        ],
      ),
    );
  }
}