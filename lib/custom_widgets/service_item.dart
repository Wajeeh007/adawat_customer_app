import 'package:adawat_customer_app/models/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:shimmer/shimmer.dart';
import '../helpers/constants.dart';
import 'custom_button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.service});

  final Service service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.isDarkMode ? darkThemeLightGrey : Colors.white,
          width: 0.1,
        ),
        color: Get.isDarkMode ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: Get.isDarkMode ? null : [
          BoxShadow(
              color: darkThemeLightGrey.withOpacity(0.6),
              spreadRadius: 0.05,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 0)
          )
        ],
      ),
      child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: Placeholder()
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service.serviceName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      service.serviceCategory!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Get.isDarkMode ? darkThemeLightGrey.withOpacity(0.5) : darkThemeLightGrey
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${service.price.toString()} ${lang_key.sar.tr}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                "(${service.measuringUnit})",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Get.isDarkMode ? darkThemeLightGrey.withOpacity(0.6) : darkThemeLightGrey
                                ),
                              )
                            ],
                          ),
                        ),
                        CustomButton(
                          onPressed: () {},
                          text: lang_key.bookNow.tr,
                          width: 80,
                          textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            color: primaryBlack
                          ),
                          borderRadius: 10,
                          color: Get.isDarkMode ? primaryDullYellow : primaryYellow,
                          height: 30,
                        )
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class ShimmerServiceItem extends StatelessWidget {
  const ShimmerServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 105,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Shimmer.fromColors(
                baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                    borderRadius: BorderRadius.circular(kBorderRadius)
                  ),
                ),
              )
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                          highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                          child: Container(
                            height: 15,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                              borderRadius: BorderRadius.circular(kBorderRadius)
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Shimmer.fromColors(
                          baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                          highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                          child: Container(
                            height: 8,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                                borderRadius: BorderRadius.circular(kBorderRadius)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                          highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                          child: Container(
                            height: 15,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                                borderRadius: BorderRadius.circular(kBorderRadius)
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Shimmer.fromColors(
                          baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                          highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                          child: Container(
                            height: 8,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                                borderRadius: BorderRadius.circular(kBorderRadius)
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}