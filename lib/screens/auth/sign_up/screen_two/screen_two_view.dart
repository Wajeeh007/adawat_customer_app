import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/auth/sign_up/screen_two/screen_two_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../../custom_widgets/stepper_text.dart';

class ScreenTwoView extends StatelessWidget {
  ScreenTwoView({super.key});

  final ScreenTwoViewModel viewModel = Get.put(ScreenTwoViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(backBtn: true,),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            StepperText(index: 1, texts: [
              lang_key.personalInfo.tr,
              lang_key.address.tr,
              lang_key.bank.tr
            ]),
            Obx(() => viewModel.fetchingLocation.value ? const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 15),
              child: CircularProgressIndicator(
                strokeWidth: 4.5,
              ),
            ) : Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: Get.width,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(kContainerRadius),
                  border: Border.all(
                    color: Get.isDarkMode ? darkThemeLightGrey : primaryBlack,
                  )
                ),
              child: const Placeholder(),
              ),
            ),
            CustomTextField(
              title: lang_key.houseOrApartment.tr,
              asterisk: true,
              hintText: '248-A',
              controller: viewModel.houseNumController,
              validator: (value) => CommonFunctions.validateDefaultField(value),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextField(
                    title: lang_key.streetOrFloor.tr,
                    asterisk: true,
                    hintText: '5',
                    keyboardType: TextInputType.number,
                    controller: viewModel.streetNumController,
                    validator: (value) => CommonFunctions.validateDefaultField(value),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    title: lang_key.lane.tr,
                    hintText: '3, John Lane',
                    controller: viewModel.laneController,
                  ),
                )
              ],
            ),
            CustomTextField(
              title: lang_key.area.tr,
              asterisk: true,
              hintText: '',
              controller: viewModel.areaController,
            ),
            CustomTextField(
              title: lang_key.city.tr,
              asterisk: true,
              hintText: 'Riyadh',
              controller: viewModel.cityController,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: lang_key.buildingName.tr,
                    hintText: '',
                    controller: viewModel.buildingNameController,
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: CustomTextField(
                    title: lang_key.nearbyLandmark.tr,
                    hintText: '',
                    controller: viewModel.nearbyLandmarkController,
                  ),
                ),
              ],
            ),
            CustomTextField(
              title: lang_key.noteForServiceman.tr,
              maxLines: 5,
              controller: viewModel.noteController,
            ),
            CustomButton(onTap: () {}, text: lang_key.cont.tr)
          ],
        ),
      ),
    );
  }
}