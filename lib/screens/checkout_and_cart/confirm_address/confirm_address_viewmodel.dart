import 'package:adawat_customer_app/models/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConfirmAddressViewModel extends GetxController {

  TextEditingController additionalNumberController = TextEditingController();

  RxList<Address> addressList = <Address>[
    Address(isDefault: true, textAddress: 'House No 242, Street 18', locationName: 'Home'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Home'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Work'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Home 2'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Office')
  ].obs;

  @override
  void onClose() {
    additionalNumberController.dispose();
    super.onClose();
  }
}