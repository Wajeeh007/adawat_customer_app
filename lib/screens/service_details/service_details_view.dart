import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/service_details/service_details_viewmodel.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

import '../../custom_widgets/title_and_text.dart';

final ServiceDetailsViewModel viewModel = Get.put(ServiceDetailsViewModel());

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backBtn: true,
        includeCart: true,
        title: lang_key.serviceDetails.tr,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset(
                        'assets/images/example_image.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                  ),
                  const DetailsTopContainer(),
                ]
              ),
            ),
            const DetailsMiddleContainer(),
            const DetailsBottomContainer(),
            const DescAndRevContainers()
          ],
        ),
      ),
    );
  }

  static Future addToCartBottomSheet(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode ? primaryGrey : Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius)
        ),
        padding: const EdgeInsets.all(10),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lang_key.quantity.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close, color: Colors.redAccent,)
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset('assets/images/example_image.jpg', fit: BoxFit.fill,),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.serviceDetails.value.serviceName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        viewModel.serviceDetails.value.serviceCategory!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: primaryYellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.add, color: primaryBlack,)
                        ),
                      ),
                      Text(
                        viewModel.selectedQuantity.value.toString(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryYellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.remove, color: primaryBlack,)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      onPressed: () => Get.back(),
                      text: lang_key.cont.tr),
              ),
            )
          ],
        ),
      );
    });
  }
}

/// Service details screen top details container widget
class DetailsTopContainer extends StatelessWidget {
  const DetailsTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: Get.height * 0.23,
        width: viewModel.containersWidth,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? primaryGrey : Colors.white,
            borderRadius: BorderRadius.circular(kBorderRadius),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 10),
                  spreadRadius: 0.05,
                  blurRadius: 20,
                  color: Theme.of(context).shadowColor
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        viewModel.serviceDetails.value.serviceName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: primaryYellow,
                            letterSpacing: 1.2
                        )
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      viewModel.serviceDetails.value.serviceCategory!,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.bottomCenter,
                    onPressed: () => viewModel.showDateAndTimePicker(context),
                  icon: const Icon(
                    Icons.add_shopping_cart_rounded,
                    size: 25,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: DottedLine(
                dashColor: darkThemeLightGrey,
                dashLength: 6,
                dashGapLength: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleAndText(
                  title: lang_key.price.tr,
                  details: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: viewModel.serviceDetails.value.price.toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                        children: [
                          TextSpan(
                              text: " ${lang_key.sar.tr}",
                              style: Theme.of(context).textTheme.labelSmall
                          )
                        ]
                    ),
                  ),),
                Container(
                  height: 50,
                  width: 1.5,
                  color: darkThemeLightGrey.withOpacity(0.7),
                ),
                TitleAndText(
                  title: lang_key.duration.tr,
                  text: '01:00 hour',
                ),
                Container(
                  height: 50,
                  width: 1.5,
                  color: darkThemeLightGrey.withOpacity(0.7),
                ),
                TitleAndText(
                  title: lang_key.rating.tr,
                  details: Row(
                    children: [
                      const RatingStars(
                        starSize: 15,
                        valueLabelVisibility: false,
                        maxValueVisibility: false,
                        starCount: 1,
                        value: 4.5,
                        starColor: primaryYellow,
                      ),
                      Text(
                        ' 4.5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// Service details middle container for discount and measuring unit
class DetailsMiddleContainer extends StatelessWidget {
  const DetailsMiddleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: viewModel.containersWidth,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? primaryGrey : Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: Get.isDarkMode ? null : [
            BoxShadow(
                offset: const Offset(0, 10),
                spreadRadius: 0.05,
                blurRadius: 20,
                color: Theme.of(context).shadowColor
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            lang_key.priceDetails.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: DottedLine(
              dashColor: darkThemeLightGrey,
              dashLength: 6,
              dashGapLength: 5,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TitleAndText(
                  title: lang_key.discount.tr,
                  text: '20% off'),
              ),
              Container(
                height: 50,
                width: 1.5,
                color: darkThemeLightGrey.withOpacity(0.7),
              ),
              Expanded(
                child: TitleAndText(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  title: lang_key.measuringUnit.tr,
                  text: viewModel.serviceDetails.value.measuringUnit,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Service details bottom container which includes tabBar widget
class DetailsBottomContainer extends StatelessWidget {
  const DetailsBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 10),
      padding: const EdgeInsets.all(5),
      width: viewModel.containersWidth,
      // height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: Get.isDarkMode ? primaryGrey : Colors.white,
          boxShadow: Get.isDarkMode ? null : [
            BoxShadow(
                offset: const Offset(0, 10),
                spreadRadius: 0.05,
                blurRadius: 20,
                color: Theme.of(context).shadowColor
            )
          ]
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: darkThemeLightGrey,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryYellow
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        controller: viewModel.tabController,
        tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              lang_key.description.tr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              lang_key.reviews.tr,
            ),
          )
        ],
      ),
    );
  }
}

/// TabBarView widget for description and reviews
class DescAndRevContainers extends StatelessWidget {
  const DescAndRevContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: viewModel.containersWidth,
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Get.isDarkMode ? primaryGrey : Colors.white,
          boxShadow: Get.isDarkMode ? null : [
            BoxShadow(
                offset: const Offset(0, 10),
                spreadRadius: 0.05,
                blurRadius: 20,
                color: Theme.of(context).shadowColor
            )
          ]
      ),
      child: TabBarView(
        controller: viewModel.tabController,
        children: const [
          DescContainer(),
          RevContainer()
        ],
      ),
    );
  }
}

/// Service description container
class DescContainer extends StatelessWidget {
  const DescContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            lang_key.serviceDesc.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: DottedLine(
              dashColor: darkThemeLightGrey,
              dashLength: 6,
              dashGapLength: 5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Service reviews container
class RevContainer extends StatelessWidget {
  const RevContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            lang_key.serviceRev.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: DottedLine(
              dashColor: darkThemeLightGrey,
              dashLength: 6,
              dashGapLength: 5,
            ),
          ),
        ],
      ),
    );
  }
}