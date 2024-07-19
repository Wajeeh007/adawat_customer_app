import 'package:adawat_customer_app/models/bottom_sheet_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../models/address.dart';

class AddressListingViewModel extends GetxController {

  /// Controller
  TextEditingController searchController = TextEditingController();

  RxList<Address> allAddressList = <Address>[
    Address(isDefault: true, textAddress: 'House No 242, Street 18', locationName: 'Home', phoneNumber: '+966 154 324 852'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Home', phoneNumber: '+966 336 424 852'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Work', phoneNumber: '+966 158 872 485'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Home 2', phoneNumber: '+966 154 345 152'),
    Address(isDefault: false, textAddress: 'House No 242, Street 18', locationName: 'Office', phoneNumber: '+966 154 325 563')
  ].obs;
  
  RxList<BottomSheetItemModel> bottomSheetItems = <BottomSheetItemModel>[
    BottomSheetItemModel(text: lang_key.text.tr, isSelected: true),
    BottomSheetItemModel(text: lang_key.phone.tr, isSelected: false),
    BottomSheetItemModel(text: lang_key.label.tr, isSelected: false),
  ].obs;

  RxString chosenFilter = ''.obs;

  @override
  void onReady() {
    chosenFilter.value = bottomSheetItems.first.text!;
    super.onReady();
  }
}