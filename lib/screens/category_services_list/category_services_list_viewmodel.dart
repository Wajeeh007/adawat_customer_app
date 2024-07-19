import 'package:adawat_customer_app/models/service.dart';
import 'package:adawat_customer_app/models/service_category.dart';
import 'package:get/get.dart';

class CategoryServicesListViewModel extends GetxController {

  RxBool fetchingCategories = true.obs;
  RxBool fetchingServices = true.obs;
  String selectedCategory = '';

  RxList<ServiceModel> allServicesList = <ServiceModel>[
    ServiceModel(price: 45, serviceName: 'AC Installation', measuringUnit: 'Per Unit', serviceCategory: 'AC Services'),
    ServiceModel(price: 110, serviceName: 'House Cleaning', measuringUnit: 'Per Sq ft.', serviceCategory: 'Cleaning'),
    ServiceModel(price: 80, serviceName: 'Paint', measuringUnit: 'Per Hour', serviceCategory: 'Painting'),
  ].obs;
  RxList<ServiceModel> visibleServicesList = <ServiceModel>[].obs;
  RxList<ServiceCategory> categoriesList = <ServiceCategory>[
    ServiceCategory(name: 'All', selected: true),
    ServiceCategory(name: 'AC Services', selected: false),
    ServiceCategory(name: 'Electricity', selected: false),
    ServiceCategory(name: 'Plumbing', selected: false),
    ServiceCategory(name: 'Carpentry', selected: false),
    ServiceCategory(name: 'Cleaning', selected: false),
  ].obs;

  Map<String, dynamic>? arguments = {};

  @override
  void onInit() {
    arguments = Get.arguments;
    if(arguments != null){
      if (arguments!.containsKey('selectedCategory')) {
        selectedCategory = arguments!['selectedCategory'];
      } else {
        selectedCategory = 'All';
      }
    } else {
      selectedCategory = 'All';
    }
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 4), () {
      fetchingCategories.value = false;
      fetchingServices.value = false;
    });
    for (var element in categoriesList) {
      if(element.name == selectedCategory) {
        element.selected = true;
      } else {
        element.selected = false;
      }
      
      if(element == categoriesList.last) {
        if(selectedCategory == 'All') {
          visibleServicesList.addAll(allServicesList);
          visibleServicesList.refresh();
        } else {
          visibleServicesList.addAll(allServicesList.where((element) => element.serviceCategory == selectedCategory));
          visibleServicesList.refresh();
        }
      }
    }
    super.onReady();
  }

}