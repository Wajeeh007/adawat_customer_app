import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'package:get/get.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.price, this.titleTextStyle, this.priceTextStyle});

  final double price;
  final TextStyle? titleTextStyle;
  final TextStyle? priceTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: price.toString(),
        style: titleTextStyle ?? Theme.of(context).textTheme.labelLarge,
        children: [
          TextSpan(
            text: " ${lang_key.sar.tr}",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Get.isDarkMode ? darkThemeLightGrey.withOpacity(0.5) : darkThemeLightGrey
            )
          )
        ]
      ),
    );
  }
}