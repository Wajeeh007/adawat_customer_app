import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import 'login_options_viewmodel.dart';

class LoginOptionsView extends StatelessWidget {
  LoginOptionsView({super.key});

  final LoginOptionsViewModel viewModel = Get.put(LoginOptionsViewModel());

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!, /// Make sure SystemUiOverlayStyle property is not empty in theme_helper file
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lang_key.login.tr,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Image(image: const Svg('assets/images/login_options_vector.svg',), height: Get.height * 0.25,),
                    ),
                    const ContinueWithEmail(),
                    const OrTextAndLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialAccButton(platformName: 'Google', onPressed: () {}),
                        SocialAccButton(platformName: 'Apple', onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lang_key.dontHaveAccount.tr,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    InkWell(
                      child: Text(
                        lang_key.signUp.tr,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            color: primaryYellow
                        ),
                      ),
                      onTap: () => Get.toNamed(AppRoutes.signUpScreenOne),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContinueWithEmail extends StatelessWidget {
  const ContinueWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
            width: 2.5
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.loginWithEmail),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.email_outlined,
              size: 25,
            ),
            const SizedBox(width: 10,),
            Text(
              lang_key.continueWithEmail.tr,
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}

class OrTextAndLine extends StatelessWidget {
  const OrTextAndLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedLine(
            lineLength: Get.width * 0.35,
            dashColor: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              lang_key.or.tr,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          DottedLine(
            lineLength: Get.width * 0.35,
            dashColor: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
          ),
        ],
      ),
    );
  }
}

class SocialAccButton extends StatelessWidget {
  const SocialAccButton({super.key, required this.platformName, required this.onPressed});

  final String platformName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: onPressed,
        child: Image.asset(
                'assets/images/${platformName.toLowerCase()}_logo.png',
              height: 35,
              width: 35,
              color: platformName.toLowerCase() == 'apple' ? Get.isDarkMode ? primaryWhite : null : null,
            ),
      ),
    );
  }
}