import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/screens/auth/sign_up/screen_three/screen_three_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../../custom_widgets/stepper_text.dart';

class ScreenThreeView extends StatelessWidget {
  ScreenThreeView({super.key});

  final ScreenThreeViewModel viewModel = Get.put(ScreenThreeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(backBtn: true,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              StepperText(index: 2, texts: [
                lang_key.personalInfo.tr,
                lang_key.address.tr,
                lang_key.bank.tr
              ]),
              CustomTextField(
                title: lang_key.cardHolderName.tr,
                asterisk: true,
                hintText: 'John Doe',
                validator: (value) => CommonFunctions.validateDefaultField(value),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9~`!@#$%&*()_=+}{|\/><:;",]'))
                ],
                controller: viewModel.nameController,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      title: lang_key.cardNumber.tr,
                      asterisk: true,
                      autoValidateMode: null,
                      keyboardType: TextInputType.number,
                      hintText: '1234 5678 xxxx xxxx',
                      validator: (value) {
                        if(CommonFunctions.validateDefaultField(value) == null) {
                          if(value!.length != 16) {
                            return lang_key.cardLength.tr;
                          } else {
                            return null;
                          }
                        } else {
                          return CommonFunctions.validateDefaultField(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      title: lang_key.cvcNumber.tr,
                      asterisk: true,
                      autoValidateMode: null,
                      keyboardType: TextInputType.number,
                      hintText: 'xxx',
                      validator: (value) {
                        if(CommonFunctions.validateDefaultField(value) == null) {
                          if(value!.length != 3) {
                            return lang_key.cvcLength.tr;
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
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.4),
                child: Column(
                  children: [
                    CustomButton(onTap: () {}, text: lang_key.skipAndSignUp.tr, color: Colors.grey.shade400,),
                    CustomButton(onTap: () {}, text: lang_key.register.tr),
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