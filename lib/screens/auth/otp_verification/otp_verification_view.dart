import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/auth/otp_verification/otp_verification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class OtpVerificationView extends StatelessWidget {
  OtpVerificationView({super.key});

  final OtpVerificationViewModel viewModel = Get.put(OtpVerificationViewModel());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        backBtn: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 40),
          child: Column(
            children: [
              Text(
                lang_key.otpSent.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 20,),
              Row(
                children: List.generate(6, (index) => TextFieldForOtp(index: index)),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    lang_key.resendCode.tr,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: primaryYellow,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryYellow
                    ),
                  ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(onPressed: () {}, text: lang_key.verify.tr,),
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

class TextFieldForOtp extends StatelessWidget {
  const TextFieldForOtp({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          cursorColor: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
          cursorHeight: 20,
          style: Theme.of(context).textTheme.labelLarge,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if(value == '' || value.isEmpty) {
              if(index != 1) {

              }
            }
          },
        ),
      ),
    );
  }
}