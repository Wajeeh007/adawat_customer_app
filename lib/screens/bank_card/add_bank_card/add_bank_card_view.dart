import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/bank_card/add_bank_card/add_bank_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../custom_widgets/custom_textfield.dart';
import '../../../helpers/common_functions.dart';

class AddBankCardView extends StatelessWidget {
  AddBankCardView({super.key});

  final AddBankCardViewModel viewModel = Get.put<AddBankCardViewModel>(AddBankCardViewModel());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.addCard.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - constraintSubtractValue,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Image(image: Svg('assets/logos/card.svg')),
                    const SizedBox(height: 20,),
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            title: lang_key.cardHolderName.tr,
                            asterisk: true,
                            hintText: 'John Doe',
                            validator: (value) => CommonFunctions.validateDefaultField(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'[0-9~`!@#$%&*()_=+}{|/><:;",]'))
                            ],
                            controller: viewModel.nameController,
                          ),
                          CardNoAndCvc(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                            onTap: () {},
                          text: lang_key.cont.tr,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Textfields for card number and CVC
class CardNoAndCvc extends StatelessWidget {
  CardNoAndCvc({super.key});

  final AddBankCardViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomTextField(
            controller: viewModel.cardNumberController,
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
            controller: viewModel.cvcController,
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
    );
  }
}