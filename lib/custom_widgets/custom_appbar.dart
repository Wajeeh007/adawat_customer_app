import 'package:adawat_customer_app/helpers/global_variables.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? includeCart;
  final String? titleText;
  final List<Widget>? action;
  final Widget? leading;
  final double? height;
  final double? leadingWidth, elevation;
  final void Function()? onTap;
  final bool? backBtn;
  final Color? bgColor;
  final Widget? bottom;
  final Widget? titleWidget;
  final bool centerTitle;
  final VoidCallback? backBtnOnPressed;

  const CustomAppBar(
      {super.key,
        this.titleText,
        this.titleWidget,
        this.centerTitle = true,
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
        this.backBtnOnPressed,
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      surfaceTintColor: Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: backBtn!,
      leadingWidth: leadingWidth,
      centerTitle: centerTitle,
      shadowColor: Theme.of(context).shadowColor,
      elevation: elevation ?? 0,
      actions: action ?? (includeCart == true ? [
        Stack(
          children: [
            IconButton(
                onPressed: () => Get.toNamed(AppRoutes.cart),
                icon: const Icon(Icons.shopping_cart_outlined)
            ),
            GlobalVariables.itemsInCart.value == 0 ? const SizedBox() : Positioned(
              top: 8,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
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
      ] : null),
      title: titleWidget ?? (titleText != null ? Text(
        titleText!,
        style: Theme.of(context).textTheme.bodyMedium,
      ) : null),
      leading: backBtn == false ? null : leading ??
              IconButton(
                onPressed: backBtnOnPressed ?? () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
      bottom: bottom != null ? PreferredSize(preferredSize: preferredSize, child: bottom!) : null
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

}