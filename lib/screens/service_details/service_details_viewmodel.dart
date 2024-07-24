import 'package:adawat_customer_app/models/service.dart';
import 'package:adawat_customer_app/screens/service_details/service_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../helpers/common_functions.dart';
import '../../helpers/constants.dart';

class ServiceDetailsViewModel extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController = TabController(length: 2, vsync: this);

  double containersWidth = Get.width * 0.9;
  RxInt selectedQuantity = 1.obs;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Rx<ServiceModel> serviceDetails = ServiceModel().obs;

  @override
  void onInit() {
    serviceDetails.value = Get.arguments['service'];
    super.onInit();
  }

  void showDateAndTimePicker(BuildContext context) async {
    selectedDate = await showDatePicker(
        helpText: lang_key.selectServiceDate.tr,
        initialDate: selectedDate ?? DateTime.now(),
        context: context,
        barrierDismissible: false,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 14)),
        builder: (context, child) {
          return Theme(data: Theme.of(context).copyWith(
              colorScheme: Get.isDarkMode ? const ColorScheme.dark(
                  primary: darkThemeLightGrey
              ) : const ColorScheme.light(
                  primary: primaryBlack
              )
          ), child: child!);
        });

    if(selectedDate == null) {
      if(context.mounted){
        CommonFunctions.showErrorToast(
            context: context, desc: lang_key.selectDateError.tr);
      }
    } else {
      if (context.mounted) {
        selectedTime = await showTimePicker(
            helpText: lang_key.selectServiceTime.tr,
            context: context,
            initialTime: TimeOfDay.now(),
            barrierDismissible: false,
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: Get.isDarkMode ? const ColorScheme.dark(
                          primary: primaryDullYellow
                      ) : const ColorScheme.light(
                          primary: primaryYellow
                      )
                  ),
                  child: child!
              );
            }
        );
        
        if(selectedTime == null) {
          if(context.mounted){
            CommonFunctions.showErrorToast(
                context: context, desc: lang_key.selectTimeError.tr);
          }
        } else {
          selectedDate = DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day, selectedTime!.hour, selectedTime!.minute);
          if(selectedDate!.difference(DateTime.now()) < const Duration(hours: 5)) {
            if(context.mounted){
              CommonFunctions.showErrorToast(
                  context: context,
                  desc: lang_key.selectedTimeShort.tr,
                height: 70
              );
            }
          } else {
            if(context.mounted){
              ServiceDetailsView().addToCartBottomSheet(context);
            }
          }
        }
      }
    }
  }
}