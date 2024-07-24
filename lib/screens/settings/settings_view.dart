import 'package:adawat_customer_app/custom_widgets/image_avatar.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:adawat_customer_app/screens/settings/settings_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final SettingsViewModel viewModel = Get.put<SettingsViewModel>(SettingsViewModel());

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingItem(
            title: 'Customer Name',
            margin: const EdgeInsets.only(top: 10),
            borderRadius: 0,
            includeShadow: false,
            includeImage: true,
            descText: 'wajeeh@gmail.com',
            suffixWidget: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.logout_rounded,
                  color: errorRed,
                  size: 28,
                )
            ),
          ),
          HeadingText(text: lang_key.account.tr),
          SettingItem(
            title: lang_key.personalDetails.tr,
            onPressed: () => Get.toNamed(AppRoutes.personalDetails),
            suffixIcon: CupertinoIcons.person,
          ),
          SettingItem(
            title: lang_key.addRemoveAddress.tr,
            onPressed: () => Get.toNamed(AppRoutes.addressListing),
            suffixIcon: Icons.location_city_rounded,
          ),
          SettingItem(
            title: lang_key.bankCards.tr,
            onPressed: () => Get.toNamed(AppRoutes.bankCardsListing),
            suffixIcon: CupertinoIcons.creditcard,
          ),
          SettingItem(
            title: lang_key.changePassword.tr,
            onPressed: () => Get.toNamed(AppRoutes.changePassword),
            suffixIcon: Icons.password_rounded,
          ),
          SettingItem(
              title: lang_key.changePhoneNumber.tr,
              onPressed: () => Get.toNamed(AppRoutes.changePhoneNumber),
            suffixIcon: CupertinoIcons.phone,
          ),
          HeadingText(text: lang_key.general.tr),
          SettingItem(
            title: lang_key.language.tr,
            onPressed: () => Get.toNamed(AppRoutes.language),
            suffixIcon: Icons.language_rounded,
          ),
          SettingItem(
            title: lang_key.support.tr,
            onPressed: () => Get.toNamed(AppRoutes.support),
            suffixIcon: Icons.support_agent_rounded,
          ),
          SettingItem(
            title: lang_key.aboutUs.tr,
            onPressed: () => Get.toNamed(AppRoutes.aboutUs),
            suffixIcon: Icons.info_outline_rounded,
          ),
          SettingItem(
            title: lang_key.termsAndConditions.tr,
            onPressed: () => Get.toNamed(AppRoutes.termsAndConditions),
            suffixIcon: CupertinoIcons.doc,
          ),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}

/// Settings item container
class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    this.onPressed,
    this.borderRadius = kContainerRadius,
    this.margin  = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.padding = const EdgeInsets.all(15),
    this.includeShadow = true,
    this.includeButton = true,
    this.includeImage = false,
    this.descText,
    this.suffixIcon,
    this.suffixWidget
  });

  final double borderRadius;
  final EdgeInsets margin, padding;
  final String title;
  final bool includeShadow;
  final bool includeButton;
  final String? descText;
  final bool includeImage;
  final VoidCallback? onPressed;
  final IconData? suffixIcon;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: includeShadow ? Get.isDarkMode ? null : kShadow : null,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            includeImage ? const ImageAvatar() : const SizedBox(),
            Column(
              children: [
                descText != null ? Text(
                  descText!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade400
                  ),
                ) : const SizedBox(),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            includeButton ? Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: suffixWidget ?? (suffixIcon != null ? Icon(
                  suffixIcon
                ) : const CircleAvatar(
                    radius: 10,
                    backgroundColor: darkThemeLightGrey,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 13, color: primaryBlack,),
                  )),
                ),
              ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

/// Settings category heading text
class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}