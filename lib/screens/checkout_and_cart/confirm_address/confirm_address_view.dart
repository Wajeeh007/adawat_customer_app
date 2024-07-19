import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/custom_widgets/location_container.dart';
import 'package:adawat_customer_app/custom_widgets/stepper_text.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../custom_widgets/custom_button.dart';
import '../../../models/address.dart';
import 'confirm_address_viewmodel.dart';

final CheckoutViewModel viewModel = Get.put<CheckoutViewModel>(CheckoutViewModel());

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backBtn: true,
        titleText: lang_key.checkout.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 20, minWidth: constraints.maxWidth),
                child: IntrinsicHeight(
                  child: Column(
                      children: [
                        StepperText(
                            index: 1, texts: [lang_key.cart.tr, lang_key.address.tr, lang_key.payment.tr]),
                        const ChosenAddressDetails(),
                        const CustomTextField(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          keyboardType: TextInputType.number,
                          title: 'Additional Phone Number:',
                          hintText: '+966123456789',
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButton(
                              onTap: () {},
                              text: lang_key.proceed.tr,
                              textColor: backgroundWhite,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        )
                      ]
                  ),
                ),
              )
          );
        }
      ),
      );
  }
}

/// Address details like name, phone, text address, map location and other addresses to choose from
class ChosenAddressDetails extends StatelessWidget {
  const ChosenAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            lang_key.address.tr,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.pin_drop_outlined,
                size: 35,
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddressDetailsText(title: '${lang_key.name.tr}: ', text: 'Syed Wajeeh Ahsan'),
                    AddressDetailsText(title: '${lang_key.phoneNumber.tr}: ', text: '+9661234567890'),
                    AddressDetailsText(title: '${lang_key.location.tr}: ', text: 'House No 242, Street No 18, Shaheen Housing Scheme, Warsak Road')
                  ],
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: LocationContainer(isAddressReq: false),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.addressList.length + 1,
              itemExtent: 150,
              shrinkWrap: true,
              itemBuilder: (context, index) {
              if(index == viewModel.addressList.length) {
                return Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline_rounded
                        ),
                    ),
                    Text(
                      lang_key.addAddress.tr,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                );
              }
                return AddressContainer(address: viewModel.addressList[index]);
              }
          ),
        )
      ],
    );
  }
}

/// Address Container for choosing address
class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key, required this.address});

  final Address address;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: address.isDefault! ? Get.isDarkMode ? primaryDullYellow : primaryYellow : Get.isDarkMode ? primaryGrey : primaryBlack,
        borderRadius: BorderRadius.circular(kContainerRadius),
            boxShadow: address.isDefault! ? Get.isDarkMode ? [] : [
              BoxShadow(
                offset: const Offset(0, 4),
                spreadRadius: 0.1,
                blurRadius: 20,
                color: Theme.of(context).shadowColor
              )
            ] : []
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              address.locationName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: backgroundWhite,
                  fontSize: 10
              ),
            ),
            Text(
              address.textAddress!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: backgroundWhite
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// RichText widget for address details
class AddressDetailsText extends StatelessWidget {
  const AddressDetailsText({super.key, required this.title, required this.text});

  final String title;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: RichText(
          text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Get.isDarkMode ? darkThemeLightGrey.withOpacity(0.7) : darkThemeLightGrey
              ),
              children: [
                TextSpan(
                    text: text,
                    style: Theme.of(context).textTheme.labelMedium
                )
              ]
          )
      ),
    );
  }
}