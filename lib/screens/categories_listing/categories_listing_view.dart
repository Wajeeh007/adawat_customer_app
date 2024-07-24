import 'package:adawat_customer_app/custom_widgets/category_item_with_image.dart';
import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/screens/categories_listing/categories_listing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class CategoriesListingView extends StatelessWidget {
  CategoriesListingView({super.key});

  final CategoriesListingViewModel viewModel = Get.put<CategoriesListingViewModel>(CategoriesListingViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.allCategories.tr,
      ),
      body: GridView.builder(
        itemCount: viewModel.categoriesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3
          ), itemBuilder: (context, index) {
            return CategoryItemWithImage(item: viewModel.categoriesList[index]);
      }
      ),
    );
  }
}