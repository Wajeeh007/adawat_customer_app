import 'package:flutter/material.dart';

class TitleAndText extends StatelessWidget {
  const TitleAndText({super.key, required this.title, this.text, this.details, this.crossAxisAlignment});

  final String title;
  final String? text;
  final Widget? details;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.grey.shade400
          ),
        ),
        const SizedBox(height: 5,),
        details == null ? text != null ? Text(
          text!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600
          ),
        ) : const SizedBox() : details!
      ],
    );
  }
}