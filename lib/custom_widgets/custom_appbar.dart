import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? includeCart;
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
        this.includeCart,
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
      actions: includeCart == true ? [
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined)
            ),
            GlobalVariables.itemsInCart.value == 0 ? const SizedBox() : Positioned(
              top: 8,
              right: 10,
              child: CircleAvatar(
                backgroundColor: primaryDullYellow,
                radius: 7,
                child: Text(
                  GlobalVariables.itemsInCart.value.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 10
                  ),
                ),
              ),
            )
          ],
        )
      ] : null,
      title: title != null ? Text(
        title!,
        style: Theme.of(context).textTheme.bodyMedium,
      ) : null,
      leading: backBtn == false ? null : leading ??
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
      bottom: bottom != null ? PreferredSize(preferredSize: preferredSize, child: bottom!) : null
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

}