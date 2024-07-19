import 'package:adawat_customer_app/custom_widgets/location_container.dart';
import 'package:adawat_customer_app/custom_widgets/status_based_widget.dart';
import 'package:adawat_customer_app/custom_widgets/title_and_text.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/single_booking/single_booking_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'bookings_listing_viewmodel.dart';

final BookingsViewModel viewModel = Get.put<BookingsViewModel>(BookingsViewModel());

class BookingsListingView extends StatelessWidget {
  const BookingsListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Get.isDarkMode ? primaryDullYellow : primaryYellow,
            padding: const EdgeInsets.only(top: 20),
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode ? primaryDullYellow : primaryYellow
            ),
            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
            controller: viewModel.tabController,
            tabs: [
              Text(lang_key.pending.tr),
              Text(lang_key.completed.tr),
              Text(lang_key.cancelled.tr)
            ]
        ),
        Expanded(
          child: TabBarView(
          controller: viewModel.tabController,
          children: const [
            PendingList(),
            CompletedList(),
            CancelledList()
          ],
                ),
        ),
    ]
    );
  }
}

class PendingList extends StatelessWidget {
  const PendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const BookingContainer(type: ContainerType.pending,);
        },
      ),
    );
  }
}

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const BookingContainer(type: ContainerType.completed,);
        },
      ),
    );
  }
}

class CancelledList extends StatelessWidget {
  const CancelledList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const BookingContainer(type: ContainerType.cancelled,);
        },
      ),
    );
  }
}

class BookingContainer extends StatelessWidget {
  const BookingContainer({super.key, required this.type});

  final ContainerType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryGrey,
        boxShadow: Get.isDarkMode ? null : kShadow,
        borderRadius: BorderRadius.circular(kContainerRadius),
      ),
      child: InkWell(
        onTap: () => Get.to(() => const SingleBookingView()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kContainerRadius),
                      child: Image.asset(
                        'assets/vectors/example_image.jpg',
                        fit: BoxFit.fill,
                        width: 100,
                        height: 80,
                      )
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AC Installation',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Get.isDarkMode ? primaryDullYellow : primaryYellow
                          ),
                        ),
                        Text(
                          'AC Services',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        type == ContainerType.cancelled || type == ContainerType.completed ? const SizedBox() : Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              // margin: const EdgeInsets.only(top: 11),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kContainerRadius),
                                color: pendingStatusBgColor
                              ),
                              child: Text(
                                lang_key.pending.tr,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: errorRed
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Text(
                    lang_key.otherServices.tr,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    decoration: BoxDecoration(
                      color: primaryDullYellow,
                      borderRadius: BorderRadius.circular(kContainerRadius),
                    ),
                    child: Text(
                      '1 more',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: backgroundWhite
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleAndText(
                          title: lang_key.date.tr,
                        text: '15 Jul, 2024',
                      ),
                      type == ContainerType.cancelled ? TitleAndText(
                        title: lang_key.cancellationDate.tr,
                        text: '14 Jul, 2024',
                      ) : TitleAndText(
                        title: lang_key.duration.tr,
                        text: '3 hours',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const LocationContainer(isAddressReq: true,),
            StatusBasedWidget(type: type),
          ],
        ),
      ),
    );
  }
}