import 'package:get/get.dart';

import '../../models/service.dart';

class PopularServicesViewModel extends GetxController {

  RxList<ServiceModel> popularServicesList = <ServiceModel>[
    ServiceModel(price: 45, serviceName: 'AC Installation', measuringUnit: 'Per Unit', serviceCategory: 'AC Services'),
    ServiceModel(price: 110, serviceName: 'House Cleaning', measuringUnit: 'Per Sq ft.', serviceCategory: 'Cleaning'),
    ServiceModel(price: 80, serviceName: 'Paint', measuringUnit: 'Per Hour', serviceCategory: 'Painting'),
  ].obs;

}