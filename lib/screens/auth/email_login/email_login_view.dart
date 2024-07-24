import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/custom_widgets/password_visibility_icon.dart';
import 'package:adawat_customer_app/helpers/routes.dart';
import 'package:adawat_customer_app/screens/auth/email_login/email_login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;

class EmailLoginView extends StatelessWidget {
  EmailLoginView({super.key});

  final EmailLoginViewModel viewModel = Get.put(EmailLoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lang_key.enterCredentials.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Image(image: const Svg('assets/vectors/login_vector.svg',), height: Get.height * 0.35,),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: viewModel.emailController,
                      title: lang_key.email.tr,
                      asterisk: true,
                      hintText: 'abc@example.com',
                    ),
                    const SizedBox(height: 10,),
                    Obx(() => CustomTextField(
                      controller: viewModel.passwordController,
                      title: lang_key.password.tr,
                      asterisk: true,
                      hintText: '******',
                      obscureText: viewModel.obscurePassword.value,
                      suffixIcon: PasswordVisibilityIcon(visibility: viewModel.obscurePassword)
                    ),
                    ),
                    CustomButton(
                      onTap: () => Get.offAllNamed(AppRoutes.bottomBar),
                      text: lang_key.login.tr,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}