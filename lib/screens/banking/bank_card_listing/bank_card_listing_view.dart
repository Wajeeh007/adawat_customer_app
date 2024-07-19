import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/models/bank_card.dart';
import 'package:adawat_customer_app/screens/banking/bank_card_listing/bank_card_listing_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:intl/intl.dart';
import '../../../helpers/constants.dart';

final BankCardListingViewModel viewModel = Get.put<BankCardListingViewModel>(BankCardListingViewModel());

class BankCardListingView extends StatelessWidget {
  const BankCardListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.bankCards.tr,
        action: [
          IconButton(
              onPressed: () {
                if(viewModel.bankCardsList.length > 4) {
                  CommonFunctions.showErrorToast(context: context, desc: lang_key.cardLimitReached.tr);
                }
              },
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                size: 25,
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            //TODO: Add Filter field
            CustomTextField(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              controller: viewModel.searchController,
              hintText: lang_key.searchCard.tr,
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 18,
              ),
            ),
            Obx(() => Column(
                children:
                  List.generate(
                    viewModel.bankCardsList.length,
                    (index) {
                      return CardItem(card: viewModel.bankCardsList[index], index: index);
                    },
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Bank Card details widget
class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.card, required this.index});

  final BankCard card;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SwipeActionCell(
        fullSwipeFactor: 0.65,
        backgroundColor: Colors.transparent,
        leadingActions: [
          SwipeAction(
            content: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(Icons.create_outlined, color: Get.isDarkMode ? primaryBlack : darkThemeLightGrey,),
              ),
            ),
            color: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
            backgroundRadius: kContainerRadius,
            onTap: (CompletionHandler handler) async {},
          )
        ],
        trailingActions: [
          SwipeAction(
            icon: const Icon(CupertinoIcons.delete_simple, color: backgroundWhite,),
            performsFirstActionWithFullSwipe: true,
            backgroundRadius: kContainerRadius,
            widthSpace: 65,
            onTap: (CompletionHandler handler) async {
              await handler(true);
              viewModel.bankCardsList.removeAt(index);
              viewModel.bankCardsList.refresh();
            },
          ),
        ],
          key: UniqueKey(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: kBorderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logos/${card.networkName!.toLowerCase()}.png',
                      height: 60,
                      width: 80,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            card.cardHolderName!,
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            card.cardNumber!,
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            side: BorderSide(
                                color: card.isDefault! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                                width: 0.5
                            ),
                            fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                              if(states.contains(WidgetState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              }
                              return Colors.transparent;
                            }),
                            value: card.isDefault,
                            onChanged: (value) {
                              if(!card.isDefault!) {
                                for (var element in viewModel.bankCardsList) {
                                  element.isDefault = false;
                                }
                                viewModel.bankCardsList.refresh();
                                card.isDefault = true;
                              }
                            }
                        ),
                        Text(
                          lang_key.makeDefaultCard.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          lang_key.expiry.tr,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          DateFormat('MM/yy').format(card.expiryDate!),
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
