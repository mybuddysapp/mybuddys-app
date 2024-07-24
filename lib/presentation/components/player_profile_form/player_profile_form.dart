import 'package:country_state_city/models/city.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mybuddys/presentation/components/my_button.dart';
import 'package:mybuddys/presentation/components/player_profile_form/controllers/player_profile_form.controller.dart';
import 'package:mybuddys/presentation/screens/profile/widgets/create_profile/form_widgets.dart';

class PlayerProfileForm extends GetView<PlayerProfileFormController> {
  const PlayerProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildTextField(
            key: controller.firstnameKey,
            hintText: 'Enter your first name',
            controller: controller.firstname,
            prefixIcon: const Icon(CupertinoIcons.person),
            validators: [
              (value) {
                if (value == null || value.isEmpty) {
                  return 'First name is required';
                }
                if (value.length < 3) {
                  return 'Minimum 3 characters';
                }
                if (value.length > 20) {
                  return 'Maximum 20 characters';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Only letters are allowed';
                }
                return null;
              }
            ],
          ),
          const SizedBox(height: 16),
          buildTextField(
            key: controller.lastnameKey,
            hintText: 'Enter your last name',
            prefixIcon: const Icon(CupertinoIcons.person),
            controller: controller.lastname,
            validators: [
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Last name is required';
                }
                if (value.length < 3) {
                  return 'Minimum 3 characters';
                }
                if (value.length > 20) {
                  return 'Maximum 20 characters';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Only letters are allowed';
                }
                return null;
              },
            ],
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            style: MyTextStyle(),
            decoration: MyInputDecoration(
              hintText: 'Gender',
              prefixIcon: const Icon(EvaIcons.gift),
            ),
            items: controller.genderOptions
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (val) {
              controller.gender.text = val ?? '';
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Gender is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          buildTextField(
            key: controller.bioKey,
            maxLines: 2,
            controller: controller.bio,
            hintText: 'Enter your bio',
            prefixIcon: const Icon(CupertinoIcons.infinite),
            validators: [
              (value) {
                if (value != null && value.length < 10) {
                  return 'Minimum 10 characters';
                }
                if (value != null && value.length > 100) {
                  return 'Maximum 100 characters';
                }
                return null;
              },
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextFormField(
              key: Key(controller.dobKey),
              controller: TextEditingController(
                text: controller.dob.value == null
                    ? ''
                    : controller.dob.value.toString().split(' ')[0],
              ),
              decoration: MyInputDecoration(
                hintText: 'Enter your date of birth',
                prefixIcon: const Icon(CupertinoIcons.calendar),
              ),
              style: MyTextStyle(),
              readOnly: false,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime(DateTime.now().year),
                );
                if (pickedDate != null) {
                  controller.dob.value = pickedDate;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date of birth is required';
                }
                if (DateTime.now().difference(DateTime.parse(value)).inDays <
                    3650) {
                  return 'You must be at least 10 years old';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          TypeAheadField(
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: MyInputDecoration(
                  hintText: 'Enter your city',
                  prefixIcon: const Icon(CupertinoIcons.location),
                ),
              );
            },
            controller: controller.country,
            itemBuilder: (BuildContext context, String value) {
              return ListTile(
                title: Text(value, style: MyTextStyle()),
              );
            },
            onSelected: controller.handleOnSelectedCountry,
            suggestionsCallback: controller.countrySuggestionsCallback,

            // decorationBuilder: (BuildContext context, Widget? child) {
            //   return Container(
            //     margin: const EdgeInsets.only(top: 8.0),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: child,
            //   );
            // },
          ),

          const SizedBox(height: 16),
          // City
          TypeAheadField(
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: MyInputDecoration(
                  hintText: 'Enter your city',
                  prefixIcon: const Icon(CupertinoIcons.location),
                ),
              );
            },
            controller: controller.city,
            itemBuilder: (BuildContext context, City value) {
              return ListTile(
                title: Text(value.name, style: MyTextStyle()),
              );
            },
            onSelected: (value) {
              controller.city.text = value.name;
            },
            suggestionsCallback: controller.citySuggestionsCallback,
          ),
          Obx(
            () => InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
                //controller.isoCode = number.isoCode!;
              },
              onInputValidated: (bool value) {
                print(value);
              },
              isEnabled: true,
              countrySelectorScrollControlled: true,

              // selectorConfig: const SelectorConfig(
              //   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              // ),

              ignoreBlank: true,
              autoValidateMode: AutovalidateMode.always,
              selectorTextStyle: MyTextStyle(),
              initialValue: PhoneNumber(isoCode: controller.isoCode.value),
              textFieldController: controller.phonenumber,
              inputDecoration: MyInputDecoration(
                hintText: 'Enter your phone number',
              ),
              inputBorder: const OutlineInputBorder(),
            ),
          ),
          // PhoneInput(
          //   key: controller.phoneKey,
          //   controller: controller.phonenumber,
          //   shouldFormat: true,
          //   defaultCountry: controller.phonenumber.value!.isoCode,
          //   decoration: MyInputDecoration(
          //     hintText: 'Enter your phone number',
          //   ),
          //   validator: PhoneValidator.validMobile(),
          //   isCountrySelectionEnabled: false,
          //   countrySelectorNavigator: const CountrySelectorNavigator.dialog(
          //     favorites: [IsoCode.FR, IsoCode.DE, IsoCode.LK],
          //     searchInputDecoration: InputDecoration(
          //       hintText: 'Search for a country',
          //       prefixIcon: Icon(CupertinoIcons.search),
          //     ),
          //   ),
          //   textInputAction: TextInputAction.done,
          //   // Define the action to perform when the "Done" button is pressed
          //   onSubmitted: (val) {
          //     // Perform any desired action when the user presses "Done"
          //     // For example, you can dismiss the keyboard
          //     // controller.phonenumber.value= PhoneNumber();
          //     FocusScope.of(context).unfocus();
          //   },
          // ),
          // // ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Are you available?'),
            value: controller.available.value,
            onChanged: (value) {
              controller.available.value = value;
            },
            secondary: const Icon(CupertinoIcons.checkmark_seal),
          ),
          // SliverPadding(
          // padding: const EdgeInsets.all(pagePadding),
          // sliver: SliverToBoxAdapter(
          // child:
          // controller.status == RxStatus.loading()
          // ? const Center(child: CircularProgressIndicator())
          // :
          MyButton(
            text: 'Create Profile',
            onTap: () {
              if (controller.formKey.currentState?.validate() ?? false) {
                controller.createProfile();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              } else {
                //formKey.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fill all required fields')),
                );
              }
            },
          ),
          // ),
          // ),
        ],
      ),
    );
  }
}
