import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:adawat_customer_app/models/bank_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:intl/intl.dart';
import '../../../custom_widgets/bottom_sheet_item.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/guider.dart';
import '../../../custom_widgets/guider_arrow_and_text.dart';
import '../../../helpers/constants.dart';
import 'bank_card_listing_viewmodel.dart';

final BankCardListingViewModel viewModel = Get.put<BankCardListingViewModel>(BankCardListingViewModel());

class BankCardListingView extends StatelessWidget {
  const BankCardListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            titleText: lang_key.bankCards.tr,
            action: [
              IconButton(
                  onPressed: () {
                    if(viewModel.bankCardsList.length > 4) {
                      CommonFunctions.showErrorToast(context: context, desc: lang_key.cardLimitReached.tr);
                    } else {
                      Get.toNamed(AppRoutes.addBankCard);
                    }
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                    size: 25,
                  ),
              )
            ],
          ),
          body: viewModel.bankCardsList.isEmpty ? const NoCardsFound() : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                const SearchField(),
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

  /// Bottom sheet for choosing filter type
  static showFilterBottomSheet(BuildContext context) {
    Get.bottomSheet(
        elevation: 8,
        Container(
          // height: Get.height * 0.3,
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: Theme.of(context).colorScheme.primaryContainer
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang_key.searchBy.tr,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: errorRed,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: darkThemeLightGrey,
              ),
              Obx(() => Column(
                children: List.generate(viewModel.bottomSheetItems.length, (int index) {
                  return BottomSheetItem(itemsList: viewModel.bottomSheetItems, index: index, chosenFilterValue: viewModel.chosenFilter,);
                }),
              ),
              ),
              CustomButton(onTap: () => Get.back(), text: lang_key.cont.tr,)
            ],
          ),
        )
    );
  }
}

/// Search and filter field at the top
class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Obx(() => CustomTextField(
              keyboardType: viewModel.chosenFilter.value == lang_key.number.tr ? TextInputType.number : TextInputType.text,
              padding: const EdgeInsets.symmetric(vertical: 10),
              controller: viewModel.searchController,
              hintText: "${lang_key.searchCard.tr} ${lang_key.by.tr} ${viewModel.chosenFilter.value}",
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 18,
              ),
              onChanged: (value) {
                //TODO: Implement search function
              },
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: CustomTextField(
            prefixIcon: const Icon(
              Icons.filter_alt_outlined,
              size: 18,
            ),
            readOnly: true,
            onTap: () => BankCardListingView.showFilterBottomSheet(context),
          ),
        )
      ],
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
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

/// Icon and text to show in case no bank cards are found
class NoCardsFound extends StatelessWidget {
  const NoCardsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.credit_card_off_outlined,
            size: 75,
          ),
          Text(
            'No Bank Cards Found',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

