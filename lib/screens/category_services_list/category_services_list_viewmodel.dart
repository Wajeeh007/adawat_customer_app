import 'package:adawat_customer_app/models/service_category.dart';
import 'package:get/get.dart';

class CategoryServicesListViewModel extends GetxController {

  RxString selectedCategory = ''.obs;

  RxList<ServiceCategory> categoriesList = <ServiceCategory>[
    ServiceCategory(name: 'All', selected: true),
    ServiceCategory(name: 'AC Services', selected: false),
    ServiceCategory(name: 'Electricity', selected: false),
    ServiceCategory(name: 'Plumbing', selected: false),
    ServiceCategory(name: 'Carpentry', selected: false),
    ServiceCategory(name: 'Cleaning', selected: false),
  ].obs;

  @override
  void onInit() {
    if(Get.arguments != null)
    super.onInit();
  }

}