import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/service_name_and_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:shimmer/shimmer.dart';
import '../../../custom_widgets/stepper_text.dart';
import '../../../helpers/constants.dart';
import 'cart_item_model.dart';
import 'cart_viewmodel.dart';

final CartViewModel viewModel = Get.find();

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: const BottomBar(),
          appBar: CustomAppBar(
            backBtn: true,
            titleText: lang_key.cart.tr,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                StepperText(index: 0, texts: [lang_key.cart.tr, lang_key.address.tr, lang_key.payment.tr]),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartItem(service: CartItemModel(price: 45, serviceName: 'AC Installation', measuringUnit: 'Per Unit', serviceCategory: 'AC Services', quantity: 5),);
                  },
                ),
              ],
            ),
          )
        ),
        const Guider()
      ],
    );
  }
}

/// Single Cart item for a service
class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.service});

  final CartItemModel service;

  @override
  Widget build(BuildContext context) {

    double containerAndPicHeight = 100;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SwipeActionCell(
        trailingActions: [
          SwipeAction(
            icon: const Icon(CupertinoIcons.delete, color: backgroundWhite),
            performsFirstActionWithFullSwipe: true,
            widthSpace: 65,
            backgroundRadius: kContainerRadius,
            onTap: (CompletionHandler handler) async {},
          ),
        ],
        key: UniqueKey(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: containerAndPicHeight,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 0.5
              ),
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: kBorderRadius,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kContainerRadius),
                  child: Image.asset(
                    'assets/vectors/example_image.jpg',
                    fit: BoxFit.fill,
                    height: containerAndPicHeight,
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceNameAndCategory(serviceCategory: service.serviceCategory!, serviceName: service.serviceName!),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${service.price.toString()} ${lang_key.sar.tr}",
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                Row(
                                  children: [
                                    QuantityButtons(isAddBtn: false, service: service,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(
                                        '2',
                                        style: Theme.of(context).textTheme.labelLarge,
                                      ),
                                    ),
                                    QuantityButtons(isAddBtn: true, service: service)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Button for incrementing and decrementing quantities of service
class QuantityButtons extends StatelessWidget {
  const QuantityButtons({super.key, required this.isAddBtn, required this.service});

  final bool isAddBtn;
  final CartItemModel service;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isAddBtn ? Get.isDarkMode ? primaryDullYellow : primaryYellow : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isAddBtn ? null : Border.all(
          color: Get.isDarkMode ? darkThemeLightGrey : primaryGrey,
        )
      ),
      child: InkWell(
        onTap: () {
          if(isAddBtn) {
            service.quantity = service.quantity! + 1;
          } else {
            service.quantity = service.quantity! - 1;
          }
          viewModel.quantities.refresh();
        },
        child: Icon(
          isAddBtn ? Icons.add : Icons.remove,
          color: isAddBtn ? backgroundWhite : Get.isDarkMode ? darkThemeLightGrey : primaryGrey,
          size: 17,
        ),
      ),
    );
  }
}

/// Bottom Appbar for showing cost
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 15,
      shadowColor: darkThemeLightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang_key.netTotal.tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  '300 ${lang_key.sar.tr}',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const SizedBox(width: 20,),
            Expanded(
                child: CustomButton(
                  onTap: () {},
                  text: lang_key.checkout.tr,
                  height: 45,
                  margin: EdgeInsets.zero,
                  color: Get.isDarkMode ? primaryDullYellow : primaryYellow,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Guiding text for first time
class Guider extends StatelessWidget {
  const Guider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => viewModel.showGuider.value ? GestureDetector(
      onTap: () => viewModel.showGuider.value = false,
      child: Container(
        padding: const EdgeInsets.only(bottom: 50),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryBlack.withOpacity(0.3), primaryBlack.withOpacity(0.9)]
          )
        ),
        // color: primaryBlack.withOpacity(0.3),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                period: const Duration(milliseconds: 750),
                  direction: ShimmerDirection.rtl,
                  baseColor: Get.isDarkMode ? darkModeShimmerBaseGrey : lightModeShimmerBaseGrey,
                  highlightColor: Get.isDarkMode ? darkModeShimmerHighGrey : lightModeShimmerHighGrey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return const Icon(Icons.arrow_back_ios_rounded, size: 45);
                      }),
                    ),
                  )
              ),
              Text(
                lang_key.slideToDelete.tr,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: backgroundWhite
                ),
              )
            ],
          ),
      ),
    ) : const SizedBox(),
    );
  }
}