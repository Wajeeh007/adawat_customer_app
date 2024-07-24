import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/global_variables.dart';
import 'package:adawat_customer_app/screens/bookings_listing/bookings_listing_view.dart';
import 'package:adawat_customer_app/screens/bottom_appbar/bottom_appbar_viewmodel.dart';
import 'package:adawat_customer_app/screens/home/home_view.dart';
import 'package:adawat_customer_app/screens/inbox/inbox_view.dart';
import 'package:adawat_customer_app/screens/notifications/notifications_view.dart';
import 'package:adawat_customer_app/screens/settings/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final BottomAppbarViewModel viewModel = Get.put<BottomAppbarViewModel>(BottomAppbarViewModel());

class BottomAppbarView extends StatelessWidget {
  const BottomAppbarView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {

      },
      child: Obx(() => Scaffold(
          appBar: CustomAppBar(
            includeCart: GlobalVariables.selectedIndex.value <= 1 ? true : false,
            backBtn: GlobalVariables.selectedIndex.value == 0 ? false : true,
            height: GlobalVariables.selectedIndex.value == 0 ? 105 : 55,
            backBtnOnPressed: () {
              viewModel.bottomNavBarController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubicEmphasized
              );
              GlobalVariables.selectedIndex.value = 0;
            },
            titleText: viewModel.appbarTitle(GlobalVariables.selectedIndex.value),
            bottom: GlobalVariables.selectedIndex.value == 0 ? const HomePageBottomWidget() : const SizedBox(),
          ),
          body: PageView(
            onPageChanged: (value) => GlobalVariables.selectedIndex.value = value,
            controller: viewModel.bottomNavBarController,
            children: [
              const HomeView(),
              const BookingsListingView(),
              InboxView(),
              const NotificationsView(),
              const SettingsView()
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: 75,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndText(
                    icon: Icons.home_outlined,
                    text: lang_key.home.tr,
                    index: 0
                ),
                IconAndText(
                    icon: CupertinoIcons.calendar,
                    text: lang_key.booking.tr,
                    index: 1
                ),
                IconAndText(
                    icon: Icons.inbox_rounded,
                    text: lang_key.inbox.tr,
                    index: 2,
                  notificationDot: true,
                ),
                IconAndText(
                    icon: Icons.notifications_none_rounded,
                    text: lang_key.notifications.tr,
                    index: 3,
                  notificationDot: true,
                ),
                IconAndText(
                    icon: GetPlatform.isIOS ? CupertinoIcons.settings : Icons.settings_outlined,
                    text: lang_key.settings.tr,
                    index: 4
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Bottom bar icon and text widget
class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
    this.notificationDot,
  });

  final int index;
  final IconData icon;
  final String text;
  final bool? notificationDot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          GlobalVariables.selectedIndex.value = index;
          viewModel.bottomNavBarController.animateToPage(
              GlobalVariables.selectedIndex.value,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubicEmphasized
          );
        },
        child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    icon,
                    size: 25,
                    color: index == GlobalVariables.selectedIndex.value ? Colors.white : darkThemeLightGrey,),
                  notificationDot == true ? CircleAvatar(
                    radius: 5,
                    backgroundColor: errorRed,
                    child: Center(
                      child: Text(
                        '1',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontSize: 7
                        ),
                      ),
                    ),
                  ) : const SizedBox()
                ],
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: Get.width * 0.029,
                  color: index == GlobalVariables.selectedIndex.value ? Colors.white : darkThemeLightGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Welcome Banner for home page
class HomePageBottomWidget extends StatelessWidget {
  const HomePageBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang_key.welcome.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 5,),
              Text(
                'Customer Name',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const Icon(
            CupertinoIcons.person_alt_circle,
            size: 55,
          )
        ],
      ),
    );
  }
}