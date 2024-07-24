import 'package:adawat_customer_app/language_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../models/bottom_sheet_item_model.dart';

class LanguageViewModel extends GetxController {

  /// Controller
  TextEditingController searchController = TextEditingController();
  LanguageController languageController = Get.find();

  RxList<BottomSheetItemModel> bottomSheetItems = <BottomSheetItemModel>[
    BottomSheetItemModel(text: lang_key.name.tr, isSelected: true),
    BottomSheetItemModel(text: lang_key.countryCode.tr, isSelected: false),
  ].obs;

  RxString chosenFilter = ''.obs;

  @override
  void onReady() {
    chosenFilter.value = bottomSheetItems.first.text!;
    super.onReady();
  }

  @override
  void onClose() {
    disposeVariables();
    super.onClose();
  }

  disposeVariables() {
    searchController.clear();
    chosenFilter.value = '';
    for (var element in bottomSheetItems) {
      element.isSelected = false;
    }
    bottomSheetItems.first.isSelected = true;
  }
}