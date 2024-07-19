import 'package:adawat_customer_app/custom_widgets/custom_text_button.dart';
import 'package:adawat_customer_app/custom_widgets/service_item.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:adawat_customer_app/models/service_category.dart';
import 'package:adawat_customer_app/models/service.dart';
import 'package:adawat_customer_app/screens/home/home_viewmodel.dart';
import 'package:adawat_customer_app/screens/home/special_offers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Obx(() => viewModel.fetchingCategories.isTrue ? const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ) : viewModel.serviceCategoriesList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.categories.tr, onTap: () {}),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {

                ServiceCategory item = viewModel.serviceCategoriesList[index];

                return CategoryListItem(item: item);
              },
            ),
          ),
        ],
      ) : Center(
        child: Text(
          lang_key.noCategoriesFound.tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      )),
    );
  }
}

/// Category List item widget
class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.item});

  final ServiceCategory item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            // duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.transparent,
                    width: 1.2
                ),
                borderRadius: BorderRadius.circular(kContainerRadius),
                color: Colors.transparent,
              ),
              child: const SizedBox(width: 45, height: 45, child: Placeholder(),)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 65,
              child: Text(
                item.name!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
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
      child: Obx(() => viewModel.fetchingOffers.isTrue ? const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ) : viewModel.specialOffersList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.specialOffers.tr, onTap: () {}),
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
      child: const Placeholder(), // TODO: Implement Cached Network Image,
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
      child: Obx(() => viewModel.fetchingPopularServices.isTrue ? const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ) : viewModel.popularServicesList.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeadingAndButton(heading: lang_key.popularServices.tr, onTap: () {}),
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
  const SectionHeadingAndButton({super.key, required this.heading, required this.onTap});

  final String heading;
  final VoidCallback onTap;

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
          CustomTextButton(onTap: onTap, text: lang_key.viewAll.tr)
        ],
      ),
    );
  }
}