import 'package:adawat_customer_app/models/service_category.dart';
import 'package:adawat_customer_app/screens/home/special_offers_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../models/service.dart';

class HomeViewModel extends GetxController {

  /// Controller(s)
  PageController specialOffersController = PageController(initialPage: 0);

  /// Variables for Progress Indicators
  RxBool fetchingCategories = true.obs;
  RxBool fetchingOffers = true.obs;
  RxBool fetchingPopularServices = true.obs;

  /// Lists for Fetched Data
  RxList<ServiceCategory> serviceCategoriesList = <ServiceCategory>[
    ServiceCategory(name: 'All', selected: true),
    ServiceCategory(name: 'AC Services', selected: false),
    ServiceCategory(name: 'Electricity', selected: false),
    ServiceCategory(name: 'Plumbing', selected: false),
    ServiceCategory(name: 'Carpentry', selected: false),
    ServiceCategory(name: 'Cleaning', selected: false),
  ].obs;
  RxList<SpecialOffersModel> specialOffersList = <SpecialOffersModel>[
    SpecialOffersModel(url: ''),
    SpecialOffersModel(url: ''),
    SpecialOffersModel(url: ''),
  ].obs;
  RxList<ServiceModel> popularServicesList = <ServiceModel>[
    ServiceModel(price: 45, serviceName: 'AC Installation', measuringUnit: 'Per Unit', serviceCategory: 'AC Services'),
    ServiceModel(price: 110, serviceName: 'House Cleaning', measuringUnit: 'Per Sq ft.', serviceCategory: 'Cleaning'),
    ServiceModel(price: 80, serviceName: 'Paint', measuringUnit: 'Per Hour', serviceCategory: 'Painting'),
  ].obs;

  /// Slider Index
  RxInt sliderIndex = 0.obs;

  /// Timer for Slider
  late Timer? timer;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 4), () {
      fetchingCategories.value = false;
      fetchingOffers.value = false;
      fetchingPopularServices.value = false;
      slideImages();
    });
    super.onReady();
  }

  slideImages() {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (sliderIndex.value < specialOffersList.length - 1) {
          sliderIndex.value = sliderIndex.value + 1;
        } else {
          sliderIndex.value = 0;
        }
        if (specialOffersController.hasClients) {
          specialOffersController.animateToPage(
            sliderIndex.value,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubicEmphasized,
          );
        }
      });
    }
}