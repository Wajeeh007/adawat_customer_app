import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/guider.dart';
import 'package:adawat_customer_app/custom_widgets/service_name_and_category.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../custom_widgets/guider_arrow_and_text.dart';
import '../../../custom_widgets/price_text.dart';
import '../../../custom_widgets/stepper_text.dart';
import '../../../helpers/constants.dart';
import 'cart_item_model.dart';
import 'cart_viewmodel.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: BottomBar(),
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
        Guider(
            guiderBool: viewModel.showGuider,
          children: [
            GuiderArrowAndText(
              text: lang_key.swipeToDelete.tr,
              arrowIcon: Icons.arrow_back_ios_new_rounded,
            ),
          ],
        )
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
            color: Theme.of(context).colorScheme.onPrimaryFixedVariant.withOpacity(0.5),
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
  QuantityButtons({super.key, required this.isAddBtn, required this.service});

  final bool isAddBtn;
  final CartItemModel service;

  final CartViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isAddBtn ? Theme.of(context).colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isAddBtn ? null : Border.all(
          color: darkThemeLightGrey,
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
  BottomBar({super.key});

  final CartViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primaryContainer,
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
                PriceText(
                  price: 300,
                  priceTextStyle: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const SizedBox(width: 20,),
            Expanded(
                child: CustomButton(
                  onTap: () => Get.toNamed(AppRoutes.confirmAddress),
                  text: lang_key.proceed.tr,
                  height: 45,
                  textColor: backgroundWhite,
                  margin: EdgeInsets.zero,
                ),
            ),
          ],
        ),
      ),
    );
  }
}