import 'package:adawat_customer_app/models/bank_card.dart';
import 'package:adawat_customer_app/screens/checkout_and_cart/payment_method/card_extended_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentMethodViewModel extends GetxController {

  TextEditingController promoCodeController = TextEditingController();

  RxBool isCashSelected = false.obs;

  RxDouble bottomBarHeight = 100.0.obs;
  RxBool showPricing = false.obs;

  RxList<CardExtendedModel> cardsList = <CardExtendedModel>[
    CardExtendedModel(isSelected: true, cardDetails: BankCard(cardHolderName: 'Syed Wajeeh Ahsan', cardNumber: '5412354711220580', networkName: 'Visa', expiryDate: DateTime.now())),
    CardExtendedModel(isSelected: false, cardDetails: BankCard(cardHolderName: 'Wajeeh Ahsan', cardNumber: '5412354711220580', networkName: 'Mastercard', expiryDate: DateTime.now())),
    CardExtendedModel(isSelected: false, cardDetails: BankCard(cardHolderName: 'Syed Ahsan', cardNumber: '5412354711220580', networkName: 'Mastercard', expiryDate: DateTime.now())),
    CardExtendedModel(isSelected: false, cardDetails: BankCard(cardHolderName: 'Syed Ahsan', cardNumber: '5412354711220580', networkName: 'Mastercard', expiryDate: DateTime.now())),
    CardExtendedModel(isSelected: false, cardDetails: BankCard(cardHolderName: 'Syed Ahsan', cardNumber: '5412354711220580', networkName: 'Mastercard', expiryDate: DateTime.now())),
  ].obs;

  @override
  void onReady() {
    if(cardsList.length <= 3) {
      showPricing.value = true;
    }
    showPricing.listen((value) {
      if(value) {
        bottomBarHeight.value = Get.height * 0.4;
      } else {
        bottomBarHeight.value = 100.0;
      }
    });
    super.onReady();
  }

}