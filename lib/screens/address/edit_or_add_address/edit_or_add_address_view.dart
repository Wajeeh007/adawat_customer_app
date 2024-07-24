import 'package:adawat_customer_app/custom_widgets/custom_appbar.dart';
import 'package:adawat_customer_app/custom_widgets/custom_text_button.dart';
import 'package:adawat_customer_app/custom_widgets/custom_textfield.dart';
import 'package:adawat_customer_app/custom_widgets/location_container.dart';
import 'package:adawat_customer_app/helpers/common_functions.dart';
import 'package:adawat_customer_app/helpers/constants.dart';
import 'package:adawat_customer_app/screens/address/edit_or_add_address/edit_or_add_address_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adawat_customer_app/helpers/languages/translations_key.dart' as lang_key;
import '../../../custom_widgets/custom_button.dart';

class EditOrAddAddressView extends StatelessWidget {
  EditOrAddAddressView({super.key});

  final EditOrAddAddressViewModel viewModel = Get.put<EditOrAddAddressViewModel>(EditOrAddAddressViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: lang_key.editAddress.tr,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight - constraintSubtractValue
                ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MapLocationAndButton(),
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            title: lang_key.label.tr,
                            asterisk: true,
                            controller: viewModel.labelController,
                            validator: (value) => CommonFunctions.validateDefaultField(value),
                            hintText: lang_key.homeWorkOffice.tr,
                          ),
                          CustomTextField(
                            title: lang_key.houseOrApartment.tr,
                            asterisk: true,
                            hintText: '248-A',
                            controller: viewModel.houseNumController,
                            validator: (value) => CommonFunctions.validateDefaultField(value),
                          ),
                          StreetAndLane(),
                          CustomTextField(
                            title: lang_key.area.tr,
                            asterisk: true,
                            hintText: 'Al Olaya',
                            controller: viewModel.areaController,
                          ),
                          CustomTextField(
                            title: lang_key.city.tr,
                            asterisk: true,
                            hintText: 'Riyadh',
                            controller: viewModel.cityController,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'[0-9@!`~#$%^&*()=+{}><?|?\/]'))
                            ],
                          ),
                          BuildingAndLandmark(),
                          PhoneNoField(),
                          CustomTextField(
                            title: lang_key.noteForServiceman.tr,
                            maxLines: 5,
                            controller: viewModel.noteController,
                          ),
                        ],
                      ),
                    ),
                    CustomButton(onTap: () {}, text: lang_key.edit.tr)
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

/// Map Location and pick from map button
class MapLocationAndButton extends StatelessWidget {
  MapLocationAndButton({super.key});

  final EditOrAddAddressViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LocationContainer(isAddressReq: false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              onTap: () {},
              text: lang_key.pickOnMap.tr,
            ),
          ),
        ),
      ],
    );
  }
}

/// Textfields for street number and lane
class StreetAndLane extends StatelessWidget {
  StreetAndLane({super.key});

  final EditOrAddAddressViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

/// Textfields for building name and nearby landmark
class BuildingAndLandmark extends StatelessWidget {
  BuildingAndLandmark({super.key});

  final EditOrAddAddressViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

/// Phone number textfield
class PhoneNoField extends StatelessWidget {
  PhoneNoField({super.key});

  final EditOrAddAddressViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          title: lang_key.phoneNumber.tr,
          hintText: '+966123456789',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 5),
          child: RichText(
            text: TextSpan(
                text: lang_key.note.tr,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                      text: lang_key.numberAssociatedWithAddress.tr,
                      style: Theme.of(context).textTheme.labelSmall
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}