import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? menuItem;
  final String? title;
  final List<Widget>? action;
  final Widget? leading;
  final double? height;
  final double? leadingWidth, elevation;
  final void Function()? onTap;
  final bool? backBtn;
  final Color? bgColor;
  final Widget? bottom;

  const CustomAppBar(
      {super.key,
        this.title,
        this.menuItem,
        this.action,
        this.leading,
        this.height = 55,
        this.leadingWidth,
        this.elevation,
        this.onTap,
        this.backBtn = true,
        this.bgColor,
        this.bottom,
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      automaticallyImplyLeading: backBtn!,
      leadingWidth: leadingWidth,
      elevation: elevation ?? 0,
      // centerTitle: true,
      actions: action,
      title: title != null ? Text(
        title!,
        style: Theme.of(context).textTheme.bodyMedium,
      ) : null,
      leading: backBtn == false ? null : leading ??
          (menuItem != null
              ? null
              : IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              )),
      bottom: bottom != null ? PreferredSize(preferredSize: preferredSize, child: bottom!) : null
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

}