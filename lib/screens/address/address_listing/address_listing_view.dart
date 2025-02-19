import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/location_container.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:shimmer/shimmer.dart';
import '../../../custom_widgets/bottom_sheet_item.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../custom_widgets/guider.dart';
import '../../../custom_widgets/guider_arrow_and_text.dart';
import '../../../helpers/common_functions.dart';
import '../../../helpers/constants.dart';
import '../../../models/address.dart';
import 'address_listing_viewmodel.dart';

class AddressListingView extends StatelessWidget {
  AddressListingView({super.key});

  final AddressListingViewModel viewModel = Get.put<AddressListingViewModel>(AddressListingViewModel());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            titleText: lang_key.address.tr,
            action: [
              IconButton(
                onPressed: () {
                  if(viewModel.allAddressList.length > 4) {
                    CommonFunctions.showErrorToast(context: context, desc: lang_key.addressLimitReached.tr);
                  } else {
                    Get.toNamed(AppRoutes.editOrAddAddress, arguments: {'isAdd', true});
                  }
                },
                icon: const Icon(
                  Icons.add_circle_outline_rounded,
                  size: 25,
                ),
              )
            ],
          ),
          body: viewModel.allAddressList.isEmpty ? const NoAddressFound() : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                SearchField(),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(viewModel.allAddressList.length, (index) {
                      return AddressItem(address: viewModel.allAddressList[index], index: index,);
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        ItemGuider(),
      ],
    );
  }

  /// Bottom sheet for choosing filter type
  showFilterBottomSheet(BuildContext context) {
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
  SearchField({super.key});

  final AddressListingViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: CustomTextField(
            keyboardType: viewModel.chosenFilter.value == lang_key.phone.tr ? TextInputType.number : TextInputType.text,
            padding: const EdgeInsets.symmetric(vertical: 10),
            controller: viewModel.searchController,
            hintText: "${lang_key.searchAddress.tr} ${lang_key.by.tr} ${viewModel.chosenFilter.value}",
            prefixIcon: const Icon(
              Icons.search_rounded,
              size: 18,
            ),
            onChanged: (value) {
              //TODO: Implement search function
            },
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
            onTap: () => AddressListingView().showFilterBottomSheet(context),
          ),
        )
      ],
    );
  }
}

/// Address item for showing details of an address
class AddressItem extends StatelessWidget {
  AddressItem({super.key, required this.address, required this.index});

  final Address address;
  final int index;

  final AddressListingViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SwipeActionCell(
        fullSwipeFactor: 0.65,
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
              onTap: (CompletionHandler handler) async => Get.toNamed(AppRoutes.editOrAddAddress),
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
                viewModel.allAddressList.removeAt(index);
                viewModel.allAddressList.refresh();
              },
            ),
          ],
          key: UniqueKey(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              borderRadius: kBorderRadius,
              // boxShadow: kShadow
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      address.locationName!,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      address.phoneNumber!,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                Text(
                  address.textAddress!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const LocationContainer(isAddressReq: false),
                Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        side: BorderSide(
                            color: address.isDefault! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                            width: 0.5
                        ),
                        fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                          if(states.contains(WidgetState.selected)) {
                            return Theme.of(context).colorScheme.primary;
                          }
                          return Colors.transparent;
                        }),
                        value: address.isDefault,
                        onChanged: (value) {
                          if(!address.isDefault!) {
                            for (var element in viewModel.allAddressList) {
                              element.isDefault = false;
                            }
                            viewModel.allAddressList.refresh();
                            address.isDefault = true;
                          }
                        }
                    ),
                    Text(
                      lang_key.makeDefaultAddress.tr,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

/// Icon and Text to show in case no address is found
class NoAddressFound extends StatelessWidget {
  const NoAddressFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_off_outlined,
            size: 75,
          ),
          Text(
            lang_key.noAddressFound.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}

/// Guide for user to perform actions
class ItemGuider extends StatelessWidget {
  ItemGuider({super.key});

  final AddressListingViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Guider(
      guiderBool: viewModel.showGuider,
      children: [
        GuiderArrowAndText(
          text: lang_key.swipeToDelete.tr,
          arrowIcon: Icons.arrow_back_ios_new_rounded,
        ),
        const SizedBox(height: 80,),
        GuiderArrowAndText(
          text: lang_key.swipeToEdit.tr,
          arrowIcon: Icons.arrow_forward_ios_rounded,
          shimmerDirection: ShimmerDirection.ltr,
        ),
      ],
    );
  }
}