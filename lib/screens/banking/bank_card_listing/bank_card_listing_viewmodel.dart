import 'package:adawat_customer_app/models/bank_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BankCardListingViewModel extends GetxController {

  /// Controller(s)
  TextEditingController searchController = TextEditingController();

  RxList<BankCard> bankCardsList = <BankCard>[
    BankCard(cardHolderName: 'Syed Wajeeh Ahsan', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 500),), networkName: 'Mastercard', isDefault: false),
    BankCard(cardHolderName: 'Wajeeh Ahsan', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 1000),), networkName: 'Visa', isDefault: false),
    BankCard(cardHolderName: 'Ahsan', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 50),), networkName: 'Mastercard', isDefault: true),
    BankCard(cardHolderName: 'Syed Wajeeh Ahsan Gillani', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 1),), networkName: 'Mastercard', isDefault: false),
    BankCard(cardHolderName: 'Syed Wajeeh', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 450),), networkName: 'Visa', isDefault: false),
    BankCard(cardHolderName: 'Wajeeh Gillani', cardNumber: '1815643298128', cardCvc: 988, expiryDate: DateTime.now().add(const Duration(days: 300),), networkName: 'Visa', isDefault: false),
  ].obs;
}