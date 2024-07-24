import 'package:adawat_customer_app/custom_widgets/custom_network_image.dart';
import 'package:adawat_customer_app/custom_widgets/title_and_text.dart';
import 'package:flutter/material.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:get/get.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key, this.isAddressReq = false});

  final bool isAddressReq;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(isAddressReq) TitleAndText(
          title: lang_key.address.tr,
          text: 'House No 220, Street No 18, Shaheen Housing Scheme, Warsak Road, Peshawar',
        ),
        const CustomNetworkImage(
            height: 150,
            width: double.infinity,
          placeholderImagePath: 'assets/vectors/location_example_image.png',
        )
      ],
    );
  }
}