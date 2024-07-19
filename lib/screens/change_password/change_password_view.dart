import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/screens/change_password/change_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final ChangePasswordViewModel viewModel = Get.put<ChangePasswordViewModel>(ChangePasswordViewModel());

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.changePassword.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight - 20, minWidth: constraints.maxWidth),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lang_key.createNewPassword.tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      lang_key.newPasswordDiff.tr,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Form(
                        key: viewModel.formKey,
                        child: Obx(() => Column(
                            children: [
                              CustomTextField(
                                controller: viewModel.newPassController,
                                validator: (value) {
                                  if(CommonFunctions.validateDefaultField(value) == null) {
                                    if(value!.length > 6) {
                                      return null;
                                    } else {
                                      return lang_key.passwordLength.tr;
                                    }
                                  } else {
                                    return CommonFunctions.validateDefaultField(value);
                                  }
                                },
                                title: lang_key.newPassword.tr,
                                obscureText: viewModel.newPassVisibility.value,
                                asterisk: true,
                                hintText: '******',
                                suffixIcon: IconButton(
                                    onPressed: () => viewModel.newPassVisibility.value = !viewModel.newPassVisibility.value,
                                    icon: Icon(
                                      viewModel.newPassVisibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    )
                                ),
                              ),
                              CustomTextField(
                                controller: viewModel.confirmPassController,
                                validator: (value) {
                                  if(CommonFunctions.validateDefaultField(value) == null) {
                                    if(viewModel.newPassController.text == '') {
                                      return null;
                                    } else {
                                      if(viewModel.newPassController.text == value) {
                                        return null;
                                      }
                                      return lang_key.passwordNotMatching.tr;
                                    }
                                  } else {
                                    return CommonFunctions.validateDefaultField(value);
                                  }
                                },
                                title: lang_key.confirmPassword.tr,
                                asterisk: true,
                                obscureText: viewModel.confirmPassVisibility.value,
                                hintText: '******',
                                suffixIcon: IconButton(
                                    onPressed: () => viewModel.confirmPassVisibility.value = !viewModel.confirmPassVisibility.value,
                                    icon: Icon(
                                      viewModel.confirmPassVisibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                            onTap: () {
                              if(viewModel.formKey.currentState!.validate()) {

                              }
                            },
                            text: lang_key.cont.tr
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}