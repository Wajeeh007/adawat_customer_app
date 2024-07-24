import 'package:adawat_customer_app/custom_widgets/category_item_with_image.dart';
import 'package:adawat_customer_app/custom_widgets/custom_network_image.dart';
import 'package:adawat_customer_app/custom_widgets/custom_text_button.dart';
import 'package:adawat_customer_app/custom_widgets/service_item.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:adawat_customer_app/models/service_category.dart';
import 'package:adawat_customer_app/models/service.dart';
import 'package:adawat_customer_app/screens/home/home_viewmodel.dart';
import 'package:adawat_customer_app/screens/home/special_offers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

final HomeViewModel viewModel = Get.put<HomeViewModel>(HomeViewModel());

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ServiceCategoriesSlider(),
                  const OffersSlider(),
                  const PopularServicesList()
                ]
              ),
            )
          ],
        ),
      ],
    );
  }
}

/// Categories horizontal list
class ServiceCategoriesSlider extends StatelessWidget {
  const ServiceCategoriesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() => viewModel.fetchingCategories.isTrue ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return const CategoryItemShimmer();
        }),
      ) : viewModel.serviceCategoriesList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.categories.tr, onTap: () => Get.toNamed(AppRoutes.categoriesListing)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(6, (index) {
                  ServiceCategory item = viewModel.serviceCategoriesList[index];
                  return CategoryItemWithImage(item: item);
                })
            ),
          ),
        ],
      ) : Center(
        child: Text(
          lang_key.noCategoriesFound.tr,
          style: Theme
              .of(context)
              .textTheme
              .labelLarge,
        ),
      )),
    );
  }
}

/// Loading Shimmer container for category item
class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryContainer,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: Container(
            height: 70,
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(kContainerRadius),
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.tertiaryContainer,
            highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
            child: Container(
              width: 65,
              height: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
                borderRadius: kBorderRadius
              ),
              ),
          ),
        ),
      ],
    );
  }
}

/// Special Offers sliding images widget
class OffersSlider extends StatelessWidget {
  const OffersSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() => viewModel.fetchingOffers.isTrue ? const OfferShimmerContainer() : viewModel.specialOffersList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.specialOffers.tr),
          SizedBox(
            height: Get.height * 0.22,
            child: PageView.builder(
              controller: viewModel.specialOffersController,
              itemCount: viewModel.specialOffersList.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                viewModel.sliderIndex.value = value;
              },
              itemBuilder: (context, index) {

                SpecialOffersModel offer = viewModel.specialOffersList[index];

                return OfferContainer(offer: offer);
              },
            ),
          ),
        ],
      ) : const SizedBox()),
    );
  }
}

/// Shimmer container for offer container
class OfferShimmerContainer extends StatelessWidget {
  const OfferShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.tertiaryContainer,
      highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          height: Get.height * 0.22,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.4),
            borderRadius: kBorderRadius
          ),
        ),
    );
  }
}

/// Offers Images container widget
class OfferContainer extends StatelessWidget {
  const OfferContainer({super.key, required this.offer});

  final SpecialOffersModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kContainerRadius),
        border: Border.all(color: Colors.transparent)
      ),
      child: const CustomNetworkImage(
          height: double.infinity,
          width: double.infinity,
        placeholderImagePath: 'assets/vectors/offer_example_image.png',
      ),
    );
  }
}

/// Popular Services list
class PopularServicesList extends StatelessWidget {
  const PopularServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() => viewModel.fetchingPopularServices.isTrue ? Column(
        children: List.generate(3, (index) => const ShimmerServiceItem()),
      ) : viewModel.popularServicesList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.popularServices.tr, onTap: () => Get.toNamed(AppRoutes.popularServices)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.popularServicesList.length,
            itemBuilder: (context, index) {

              ServiceModel service = viewModel.popularServicesList[index];

              return ServiceItem(service: service);
            },
          ),
        ],
      ) : const SizedBox()),
    );
  }
}

/// Section Heading Text And View All button widget
class SectionHeadingAndButton extends StatelessWidget {
  const SectionHeadingAndButton({super.key, required this.heading, this.onTap});

  final String heading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap == null ? const SizedBox() : CustomTextButton(onTap: onTap!, text: lang_key.viewAll.tr)
        ],
      ),
    );
  }
}