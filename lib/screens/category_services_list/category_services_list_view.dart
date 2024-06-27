import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/models/service_category.dart';
import 'package:adawat_customer_app/screens/category_services_list/category_services_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class CategoryServicesListView extends StatelessWidget {
  CategoryServicesListView({super.key});

  final CategoryServicesListViewModel viewModel = Get.put(CategoryServicesListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backBtn: true,
        title: lang_key.categories.tr,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              
            ]
          )
          )
        ],
      ),
    );
  }
}

class CategoryTitleContainer extends StatelessWidget {
  CategoryTitleContainer({super.key, required this.serviceCategory});

  final ServiceCategory serviceCategory;
  final CategoryServicesListViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        int index = viewModel.categoriesList.indexWhere((element) => element.selected!);
        viewModel.categoriesList[index].selected = false;
        serviceCategory.selected = true;
        viewModel.categoriesList.refresh();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: serviceCategory.selected! ? primaryYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: primaryYellow,
            width: 1.2
          )
        ),
      ),
    );
  }
}