import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/custom_widgets/image_avatar.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/profile_settings/profile_settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

final ProfileSettingsViewModel viewModel = Get.put<ProfileSettingsViewModel>(ProfileSettingsViewModel());

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.profileSettings.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight - 20),
              child: IntrinsicHeight(
                child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const EditImage(),
                        Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                asterisk: true,
                                title: lang_key.fullName.tr,
                                controller: viewModel.nameController,
                                validator: (value) => CommonFunctions.validateDefaultField(value),
                              ),
                              CustomTextField(
                                keyboardType: TextInputType.emailAddress,
                                asterisk: true,
                                title: lang_key.email.tr,
                                controller: viewModel.emailController,
                                validator: (value) => CommonFunctions.validateEmail(value),
                              ),
                            ],
                          ),
                        ),
                        const BottomButtons()
                      ],
                    ),
                  ),
              ),
            ),
          );
        }
      ),
    );
  }
}

/// Image and edit icon widgets
class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ImageAvatar(heightAndWidth: 70,),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: darkThemeLightGrey,
              radius: 13,
              child: Icon(
                Icons.edit_outlined,
                size: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

/// Buttons at the bottom of screen
class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  onTap: () {},
                  text: lang_key.saveAndUpdate.tr
              ),
              CustomButton(
                onTap: () => Get.back(),
                text: lang_key.discard.tr,
                color: Colors.transparent,
                borderStyle: Border.all(
                    color: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
                    width: 0.5
                ),
                textColor: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
