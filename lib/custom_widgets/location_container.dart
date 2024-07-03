import 'package:adawat_customer_app/custom_widgets/title_and_text.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:get/get.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key, required this.isAddressReq});

  final bool isAddressReq;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isAddressReq ? TitleAndText(
          title: lang_key.address.tr,
          text: 'House No 220, Street No 18, Shaheen Housing Scheme, Warsak Road, Peshawar',
        ) : const SizedBox(),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius)
          ),
          child: const Placeholder(),
        )
      ],
    );
    //   Container(
    //   width: double.infinity,
    //   height: isAddressReq ? null : 150,
    //   decoration: isAddressReq ? null : BoxDecoration(
    //     borderRadius: BorderRadius.circular(kBorderRadius)
    //   ),
    //   child: isAddressReq ? Column(
    //     children: [
    //       TitleAndText(
    //         title: lang_key.address.tr,
    //         text: 'House No 220, Street No 18, Shaheen Housing Scheme, Warsak Road, Peshawar',
    //       ),
    //       SizedBox(child: const Placeholder()),
    //     ],
    //   ) : const Placeholder(),
    // );
  }
}