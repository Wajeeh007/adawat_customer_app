import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: primaryDullYellow,
          decorationColor: primaryDullYellow,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}
