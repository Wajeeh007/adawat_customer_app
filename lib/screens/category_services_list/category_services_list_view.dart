import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/service_item.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/models/service_category.dart';
import 'package:adawat_customer_app/screens/category_services_list/category_services_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:shimmer/shimmer.dart';

CategoryServicesListViewModel viewModel = Get.put(CategoryServicesListViewModel());

class CategoryServicesListView extends StatelessWidget {
  const CategoryServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backBtn: true,
        title: lang_key.categories.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                const CategoriesList(),
                const ServicesList(),
              ]
            )
            )
          ],
        ),
      ),
    );
  }
}

/// Categories list widget
class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Obx(() => viewModel.fetchingCategories.isTrue ? Shimmer.fromColors(
        baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
        highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
        child: Row(
          children: List.generate(4, (index) {
            return Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                borderRadius: BorderRadius.circular(kBorderRadius)
              ),
            );
          }),
        ),
      ) : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.categoriesList.length,
            itemBuilder: (context, index) {

              final category = viewModel.categoriesList[index];

              return CategoryTitleContainer(serviceCategory: category);
            }
        ),
      ),
    );
  }
}

/// Category name container
class CategoryTitleContainer extends StatelessWidget {
  const CategoryTitleContainer({super.key, required this.serviceCategory});

  final ServiceCategory serviceCategory;

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
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: serviceCategory.selected! ? primaryDullYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: primaryDullYellow,
            width: 1.2
          )
        ),
        child: Text(
          serviceCategory.name!,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: serviceCategory.selected! ? Colors.white : null
          ),
        ),
      ),
    );
  }
}

/// Visible Services list widget
class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: viewModel.fetchingServices.isTrue ? 6 : viewModel.allServicesList.length,
          itemBuilder: (context, index) {
            if(viewModel.fetchingServices.isTrue) {
             return const ShimmerServiceItem();
            } else {
              final service = viewModel.allServicesList[index];

              return ServiceItem(service: service);
            }
          },
        ),
      ),
    );
  }
}
