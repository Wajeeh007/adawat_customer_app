import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/location_container.dart';
import 'package:adawat_customer_app/custom_widgets/status_based_widget.dart';
import 'package:adawat_customer_app/custom_widgets/status_container.dart';
import 'package:adawat_customer_app/custom_widgets/title_and_text.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/single_booking/single_booking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final SingleBookingViewModel viewModel = Get.put<SingleBookingViewModel>(SingleBookingViewModel());

class SingleBookingView extends StatelessWidget {
  const SingleBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backBtn: true,
        titleText: lang_key.bookingDetails.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight -20),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleAndText(title: lang_key.services.tr),
                        TitleAndText(title: lang_key.quantity.tr)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Column(
                        children: List.generate(2, (index) {
                          return const ServiceContainer();
                        }),
                      ),
                    ),
                    const LocationAndTime(),
                    const CostDetails(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: StatusBasedWidget(type: ContainerType.pending,
                          starsOffColor: Get.isDarkMode
                              ? primaryGrey
                              : darkThemeLightGrey,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

/// Widget to show time, duration and location of the booking
class LocationAndTime extends StatelessWidget {
  const LocationAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleAndText(
                    title: lang_key.date.tr,
                    text: '15 Jul, 2024',
                  ),
                  TitleAndText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    title: lang_key.duration.tr,
                    text: '3 Hours',
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const LocationContainer(isAddressReq: true,),
            ],
          ),
        )
      ],
    );
  }
}

/// Text to show total cost of services
class CostDetails extends StatelessWidget {
  const CostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Cost',style: Theme.of(context).textTheme.labelLarge,),
          Text('150 ${lang_key.sar.tr}', style: Theme.of(context).textTheme.labelLarge,)
        ],
      ),
    );
  }
}

/// Service name, category, status and quantity widget
class ServiceContainer extends StatelessWidget {
  const ServiceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kContainerRadius),
                child: Image.asset(
                    'assets/vectors/example_image.jpg',
                  height: 80,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 15,),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AC Installation',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16
                      )
                    ),
                    Text(
                      'AC Services',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: StatusContainer(
                            color: pendingStatusBgColor,
                            text: 'Pending',
                            textColor: errorRed
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'x1',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
