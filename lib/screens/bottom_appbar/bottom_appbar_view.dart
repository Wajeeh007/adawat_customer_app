import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/global_variables.dart';
import 'package:adawat_customer_app/screens/bottom_appbar/bottom_appbar_viewmodel.dart';
import 'package:adawat_customer_app/screens/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class BottomAppbarView extends StatelessWidget {
  BottomAppbarView({super.key});

  final BottomAppbarViewModel viewModel = Get.put(BottomAppbarViewModel());
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {

      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Obx(() => Text(
              viewModel.appbarTitle(GlobalVariables.selectedIndex.value)
          )),
          bottom: GlobalVariables.selectedIndex.value == 0 ? PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
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
              )
          ) : null
        ),
        body: PageView(
            controller: viewModel.bottomNavBarController,
          children: [
            HomeView()
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 75,
          color: primaryYellow,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                  onTap: () {},
                  icon: Icons.home_outlined,
                  text: lang_key.home.tr,
                  index: 0
              ),
              IconAndText(
                  onTap: () {},
                  icon: CupertinoIcons.calendar,
                  text: lang_key.bookings.tr,
                  index: 1
              ),
              IconAndText(
                  onTap: () {},
                  icon: Icons.inbox_rounded,
                  text: lang_key.inbox.tr,
                  index: 2,
                notificationDot: true,
              ),
              IconAndText(
                  onTap: () {},
                  icon: Icons.notifications_none_rounded,
                  text: lang_key.notifications.tr,
                  index: 3,
                notificationDot: true,
              ),
              IconAndText(
                  onTap: () {},
                  icon: GetPlatform.isIOS ? CupertinoIcons.settings : Icons.settings_outlined,
                  text: lang_key.settings.tr,
                  index: 4
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.index,
    this.notificationDot,
  });

  final int index;
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final bool? notificationDot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    icon,
                    size: 23,
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
                  fontSize: 10,
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