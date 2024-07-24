import 'package:get/get.dart';

import '../../models/service_category.dart';

class CategoriesListingViewModel extends GetxController {

  RxList<ServiceCategory> categoriesList = <ServiceCategory>[
    ServiceCategory(name: 'All', selected: false),
    ServiceCategory(name: 'AC Services', selected: false),
    ServiceCategory(name: 'Electricity', selected: false),
    ServiceCategory(name: 'Plumbing', selected: false),
    ServiceCategory(name: 'Carpentry', selected: false),
    ServiceCategory(name: 'Cleaning', selected: false),
  ].obs;

}