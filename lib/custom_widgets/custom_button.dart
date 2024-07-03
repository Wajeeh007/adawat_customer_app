import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor = primaryBlack,
    this.width,
    this.textStyle,
    this.height,
    this.borderRadius,
    this.margin,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? width, height;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 20),
      height: height ?? 55,
      width: width ?? Get.width,
      decoration: BoxDecoration(
        color: color ?? primaryYellow,
        borderRadius: BorderRadius.circular(borderRadius ?? kBorderRadius),
        border: Border.all(
          color: color ?? primaryYellow,
        )
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor
            ),
          ),
      ),
    );
  }
}