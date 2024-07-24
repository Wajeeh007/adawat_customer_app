import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/service_item.dart';
import 'package:adawat_customer_app/screens/popular_services/popular_services_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class PopularServicesView extends StatelessWidget {
  PopularServicesView({super.key});

  final PopularServicesViewModel viewModel = Get.put(PopularServicesViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.popularServices.tr,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        itemCount: viewModel.popularServicesList.length,
        itemBuilder: (context, index) {
          return ServiceItem(service: viewModel.popularServicesList[index]);
        },
      ),
    );
  }
}
