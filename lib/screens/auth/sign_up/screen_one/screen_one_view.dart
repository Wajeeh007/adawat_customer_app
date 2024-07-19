import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/custom_widgets/password_visibility_icon.dart';
import 'package:adawat_customer_app/custom_widgets/stepper_text.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/screens/auth/sign_up/screen_one/screen_one_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../../helpers/constants.dart';

final ScreenOneViewModel viewModel = Get.put<ScreenOneViewModel>(ScreenOneViewModel());

class ScreenOneView extends StatelessWidget {
  const ScreenOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepperText(index: 0, texts: [
              lang_key.personalInfo.tr,
              lang_key.address.tr,
              lang_key.bank.tr
            ]),
            Image(image: const Svg('assets/vectors/sign_up_vector.svg',), height: Get.height * 0.3,),
            Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  CustomTextField(
                    title: lang_key.fullName.tr,
                    hintText: 'John Doe',
                    asterisk: true,
                    controller: viewModel.nameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9@~`#%&*(){}:;><?/+=|!]'))
                    ],
                  ),
                  CustomTextField(
                    asterisk: true,
                    title: lang_key.email.tr,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9.@]'))],
                    controller: viewModel.emailController,
                    hintText: 'abc@exampple.com',
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value)  => CommonFunctions.validateEmail(value)
                  ),
                  const PhoneNoTextField(),
                  Obx(() => CustomTextField(
                    asterisk: true,
                    hintText: '******',
                    title: lang_key.password.tr,
                    controller: viewModel.passwordController,
                    obscureText: viewModel.obscurePassword.value,
                    suffixIcon: PasswordVisibilityIcon(visibility: viewModel.obscurePassword),
                    validator: (value) {
                      if(CommonFunctions.validateDefaultField(value) == null) {
                        if(value!.length < 6) {
                          return lang_key.passwordLength.tr;
                        } else {
                          return null;
                        }
                      } else {
                        return CommonFunctions.validateDefaultField(value);
                      }
                    },
                  )),
                  Obx(() => CustomTextField(
                    asterisk: true,
                    hintText: '******',
                    title: lang_key.confirmPassword.tr,
                    controller: viewModel.confirmPasswordController,
                    obscureText: viewModel.obscureConfirmPassword.value,
                    suffixIcon: PasswordVisibilityIcon(visibility: viewModel.obscureConfirmPassword),
                    validator: (value) {
                      if(CommonFunctions.validateDefaultField(value) == null) {
                        return viewModel.isPasswordMatching(value);
                      } else {
                        return CommonFunctions.validateDefaultField(value);
                      }
                    },
                  )),
                  CustomButton(
                      onTap: () {
                        if(viewModel.formKey.currentState!.validate()) {

                        }
                      },
                      text: lang_key.cont.tr
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Textfield for phone number. Contains two fields but one is set to be onlyRead because it is for country code
class PhoneNoTextField extends StatelessWidget {
  const PhoneNoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5),
          child: RichText(
            text: TextSpan(
              text: lang_key.phoneNumber.tr,
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                  text: '*',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: errorRed),
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(kContainerRadius),
                      border: Border.all(
                          color: Get.isDarkMode ? darkThemeLightGrey : lightThemeBorderGrey,
                          width: 1.2
                      )
                  ),
                  child: Text(
                    '+966',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '-',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Expanded(
              flex: 7,
              child: CustomTextField(
                keyboardType: TextInputType.number,
                controller: viewModel.phoneController,
                hintText: '1234567',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if(CommonFunctions.validateDefaultField(value) == null) {
                    if(value!.length < 10) {
                      return lang_key.enterValidPhoneNo.tr;
                    } else {
                      return null;
                    }
                  } else {
                    return CommonFunctions.validateDefaultField(value);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}