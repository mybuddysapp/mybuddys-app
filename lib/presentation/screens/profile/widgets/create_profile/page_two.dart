// import 'package:auth_provider/auth_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
// // import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:intl/intl.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:mybuddys/infrastructure/utils/const.dart';
// import 'package:mybuddys/presentation/components/my_button.dart';
// import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';
// import 'package:mybuddys/presentation/screens/profile/controllers/page_two.controller.dart';
// import 'package:phone_input/phone_input_package.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
//
// import 'create_profile_sliver.dart';
// import 'form_widgets.dart';
//
// SliverWoltModalSheetPage page2(
//   BuildContext context,
// ) {
//   final controller = Get.find<PageTwoController>();
//   final profileController = Get.find<CreateProfileController>();
//
//   final usernameController = TextEditingController();
//   final bioController = TextEditingController();
//   final textTheme = Theme.of(context).textTheme;
//   // final formKey = GlobalKey<FormBuilderState>();
//
//   return SliverWoltModalSheetPage(
//     // hasSabGradient: true,
//     enableDrag: true,
//     resizeToAvoidBottomInset: true,
//     pageTitle: Padding(
//       padding: const EdgeInsets.all(pagePadding),
//       child: Obx(
//         () => Center(
//           child: Text(
//             'Hey ${controller.pseudo.value.toString()}',
//             style: TextStyle(
//               color: Get.textTheme.headlineLarge!.color,
//               fontSize: 40,
//             ),
//           ),
//         ),
//       ),
//     ),
//     leadingNavBarWidget: WoltModalSheetBackButton(
//       onBackPressed: () {
//         profileController.previousPage();
//       },
//     ),
//     trailingNavBarWidget: WoltModalSheetCloseButton(onClosed: () {
//       Navigator.of(context).pop();
//     }),
//     mainContentSlivers: [
//       SliverSafeArea(
//         sliver: SliverToBoxAdapter(
//           key: UniqueKey(),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Get.theme.scaffoldBackgroundColor,
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(pagePadding),
//               child: FormBuilder(
//                 onChanged: () {
//                   // formKey.currentState!.save();
//                   // debugPrint(formKey.currentState!.value.toString());
//                 },
//                 child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     //avatar
//                     // FormBuilder
//                     buildTextField(
//                       key: controller.firstnameKey,
//                       hintText: 'Enter your first name',
//                       controller: controller.firstname,
//                       prefixIcon: const Icon(CupertinoIcons.person),
//                       validators: [
//                         // FormBuilderValidators.required(),
//                         // FormBuilderValidators.minLength(3,
//                         //     errorText: 'Minimum 3 characters'),
//                         // FormBuilderValidators.maxLength(20,
//                         //     errorText: 'Maximum 20 characters'),
//                         // // should not contain anything other than letters
//                         // FormBuilderValidators.match(
//                         //   r'^[a-zA-Z]+$',
//                         //   errorText: 'Only letters are allowed',
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     buildTextField(
//                       key: controller.lastnameKey,
//                       hintText: 'Enter your last name',
//                       prefixIcon: const Icon(CupertinoIcons.person),
//                       controller: controller.lastname,
//                       validators: [
//                         // FormBuilderValidators.required(),
//                         // FormBuilderValidators.minLength(3,
//                         //     errorText: 'Minimum 3 characters'),
//                         // FormBuilderValidators.maxLength(20,
//                         //     errorText: 'Maximum 20 characters'),
//                         // // should not contain anything other than letters
//                         // FormBuilderValidators.match(
//                         //   r'^[a-zA-Z]+$',
//                         //   errorText: 'Only letters are allowed',
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     //gender
//                     //MALE , FEMALE , OTHER
//                     FormBuilderDropdown<String>(
//                       name: 'gender',
//                       decoration: MyInputDecoration(
//                         hintText: 'Gender',
//                         prefixIcon: Icon(EvaIcons.gift),
//                       ),
//                       // validators: FormBuilderValidators.compose(
//                       //     [FormBuilderValidators.required()]),
//                       items: controller.genderOptions
//                           .map((gender) => DropdownMenuItem(
//                                 alignment: AlignmentDirectional.center,
//                                 value: gender,
//                                 child: Container(
//                                   child: Text(
//                                     gender,
//                                     style: TextStyle(
//                                         // backgroundColor: Colors.green,
//                                         ),
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                       onChanged: (val) {
//                         logger.e(val.toString().toUpperCase() + ' --efe');
//                         controller.gender.text = val.toString().toUpperCase();
//                       },
//                       valueTransformer: (val) => val?.toString(),
//                     ),
//                     const SizedBox(height: 16),
//                     //bio
//                     buildTextField(
//                       key: controller.bioKey,
//                       maxLines: 3,
//                       controller: bioController,
//                       hintText: 'Enter your bio',
//                       prefixIcon: const Icon(CupertinoIcons.infinite),
//                       validators: [
//                         // FormBuilderValidators.minLength(10,
//                         //     errorText: 'Minimum 10 characters'),
//                         // FormBuilderValidators.maxLength(100,
//                         //     errorText: 'Maximum 100 characters'),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     //date of birth
//                     FormBuilderDateTimePicker(
//                       name: controller.dobKey,
//                       inputType: InputType.date,
//                       controller: TextEditingController(
//                         text: controller.dob.value.toString().split(' ')[0],
//                       ),
//                       format: DateFormat('yyyy-MM-dd'),
//                       initialDate: DateTime(2000),
//                       lastDate: DateTime(DateTime.now().year),
//                       firstDate: DateTime(DateTime.now().year - 100),
//                       decoration: MyInputDecoration(
//                         hintText: 'Enter your date of birth',
//                         prefixIcon: const Icon(CupertinoIcons.calendar),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     //phone number
//                     PhoneInput(
//                       key: const Key('phone-field'),
//                       controller: controller.phonenumber,
//                       // Phone controller
//                       initialValue: null,
//                       // can't be supplied simultaneously with a controller
//                       shouldFormat: true,
//                       // default
//                       defaultCountry: IsoCode.US,
//                       // default
//                       decoration: MyInputDecoration(
//                         hintText: 'Enter your phone number',
//                         // prefixIcon: const Icon(CupertinoIcons.phone),
//                       ),
//                       validators: PhoneValidator.validMobile(),
//                       // default PhoneValidator.valid()
//                       isCountrySelectionEnabled: true,
//                       // default
//                       countrySelectorNavigator:
//                           CountrySelectorNavigator.modalBottomSheet(
//                         favorites: [IsoCode.FR, IsoCode.DE, IsoCode.LK],
//                         searchInputDecoration: InputDecoration(
//                           hintText: 'Search for a country',
//                           prefixIcon: const Icon(CupertinoIcons.search),
//                         ),
//                       ),
//                       // CountrySelectorNavigator.dropdown(
//                       //   backgroundColor: const Color(0xFFE7DEF6),
//                       //   borderRadius: BorderRadius.circular(15),
//                       //   layerLink: LayerLink(),
//                       //   showSearchInput: true,
//                       // ),
//                       // required
//                       showFlagInInput: true,
//                       // default
//                       flagShape: BoxShape.circle,
//                       // default
//                       showArrow: true,
//                       // default
//                       flagSize: 16,
//                       // default
//                       autofillHints: const [AutofillHints.telephoneNumber],
//                       // default to null
//                       enabled: true,
//                       // default
//                       autofocus: false,
//                       // default
//                       // onSaved: (PhoneNumber p) => print('saved $p'),
//                       // default null
//                       // onChanged: (PhoneNumber p) =>
//                       //     print('changed $p'), // default null
// // ... + other textfield params
//                     ),
//                     // buildTextField(
//                     //   key: controller.phoneKey,
//                     //   hintText: 'Enter your phone number',
//                     //   controller: controller.phonenumber,
//                     //   prefixIcon: const Icon(CupertinoIcons.phone),
//                     //   validators: [
//                     //     FormBuilderValidators.required(),
//                     //     FormBuilderValidators.minLength(10,
//                     //         errorText: 'Minimum 10 characters'),
//                     //     FormBuilderValidators.maxLength(15,
//                     //         errorText: 'Maximum 15 characters'),
//                     //     FormBuilderValidators.numeric(),
//                     //   ],
//                     // ),
//                     const SizedBox(height: 16),
//                     //address
//                     buildTextField(
//                       onTap: () => Get.dialog(
//                         FlutterMap(
//                           options: MapOptions(
//                             initialCenter: LatLng(51.509364, -0.128928),
//                             initialZoom: 9.2,
//                           ),
//                           children: [
//                             TileLayer(
//                               urlTemplate:
//                                   'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                               userAgentPackageName: 'com.example.app',
//                             ),
//                             CurrentLocationLayer(),
//                             RichAttributionWidget(
//                               attributions: [
//                                 TextSourceAttribution(
//                                   'OpenStreetMap contributors',
//                                   onTap: () => launchUrl(Uri.parse(
//                                       'https://openstreetmap.org/copyright')),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       key: controller.cityKey,
//                       hintText: 'Enter your city',
//                       controller: controller.city,
//                       prefixIcon: const Icon(CupertinoIcons.location),
//                       validators: [
//                         // FormBuilderValidators.required(),
//                         // FormBuilderValidators.minLength(3,
//                         //     errorText: 'Minimum 3 characters'),
//                         // FormBuilderValidators.maxLength(20,
//                         //     errorText: 'Maximum 20 characters'),
//                         // // should not contain anything other than letters
//                         // FormBuilderValidators.match(
//                         //   r'^[a-zA-Z]+$',
//                         //   errorText: 'Only letters are allowed',
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     //country
//                     buildTextField(
//                       key: controller.countryKey,
//                       hintText: 'Enter your country',
//                       controller: controller.country,
//                       prefixIcon: const Icon(CupertinoIcons.location),
//                       validators: [
//                         // FormBuilderValidators.required(),
//                         // FormBuilderValidators.minLength(3,
//                         //     errorText: 'Minimum 3 characters'),
//                         // FormBuilderValidators.maxLength(20,
//                         //     errorText: 'Maximum 20 characters'),
//                         // // should not contain anything other than letters
//                         // FormBuilderValidators.match(
//                         //   r'^[a-zA-Z]+$',
//                         //   errorText: 'Only letters are allowed',
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//
//                     // availablity
//                     //true by default
//                     FormBuilderSwitch(
//                       name: controller.availableKey,
//                       title: const Text('Are you available?'),
//                       initialValue: true,
//                       decoration: MyInputDecoration(
//                         hintText: 'Are you available?',
//                         prefixIcon: const Icon(CupertinoIcons.checkmark_seal),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       SliverPadding(
//         padding: const EdgeInsets.all(pagePadding),
//         sliver: SliverToBoxAdapter(
//           child: controller.status == RxStatus.loading()
//               ? const Center(child: CircularProgressIndicator())
//               : MyButton(
//                   text: 'Create Profile',
//                   onTap: () {
//                     controller.createProfile();
//                     // if (formKey.currentState!.saveAndValidate()) {
//                     //   // ref.refresh(playerProfileProvider.notifier);
//                     //   // ref.read(playerProfileProvider.notifier).createProfile();
//                     // }
//                     // if (formKey.currentState!.saveAndValidate()) {
//                     // If the form is valid, display a snackbar. In the real world,
//                     // you'd often call a server or save the information in a database.
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                     // }
//                   },
//                 ),
//         ),
//       ),
//     ],
//   );
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:mybuddys/presentation/components/my_button.dart';
import 'package:mybuddys/presentation/components/player_profile_form/player_profile_form.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/page_two.controller.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import 'create_profile_sliver.dart';

SliverWoltModalSheetPage page2(
  BuildContext context,
) {
  final controller = Get.find<PageTwoController>();
  final profileController = Get.find<CreateProfileController>();

  return SliverWoltModalSheetPage(
    enableDrag: true,
    resizeToAvoidBottomInset: true,
    pageTitle: Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Obx(
        () => Center(
          child: Text(
            'Hey ${controller.pseudo.value.toString()}',
            style: TextStyle(
              color: Get.textTheme.headlineLarge!.color,
              fontSize: 40,
            ),
          ),
        ),
      ),
    ),
    leadingNavBarWidget: WoltModalSheetBackButton(
      onBackPressed: () {
        profileController.previousPage();
      },
    ),
    trailingNavBarWidget: WoltModalSheetCloseButton(onClosed: () {
      Navigator.of(context).pop();
    }),
    mainContentSlivers: [
      SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: controller.status == RxStatus.loading()
                ? const Center(child: CircularProgressIndicator())
                : controller.status == RxStatus.success()
                    ?
                    //should quit the Modal sheet
                    const Center(child: Text('Profile created successfully'))
                    : PlayerProfileForm(),
            // child: Form(
            //   key: controller.formKey,
            //   child: Column(
            //     children: [
            //       buildTextField(
            //         key: controller.firstnameKey,
            //         hintText: 'Enter your first name',
            //         controller: controller.firstname,
            //         prefixIcon: const Icon(CupertinoIcons.person),
            //         validators: [
            //           (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'First name is required';
            //             }
            //             if (value.length < 3) {
            //               return 'Minimum 3 characters';
            //             }
            //             if (value.length > 20) {
            //               return 'Maximum 20 characters';
            //             }
            //             if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //               return 'Only letters are allowed';
            //             }
            //             return null;
            //           }
            //         ],
            //       ),
            //       const SizedBox(height: 16),
            //       buildTextField(
            //           key: controller.lastnameKey,
            //           hintText: 'Enter your last name',
            //           prefixIcon: const Icon(CupertinoIcons.person),
            //           controller: controller.lastname,
            //           validators: [
            //             (value) {
            //               if (value == null || value.isEmpty) {
            //                 return 'Last name is required';
            //               }
            //               if (value.length < 3) {
            //                 return 'Minimum 3 characters';
            //               }
            //               if (value.length > 20) {
            //                 return 'Maximum 20 characters';
            //               }
            //               if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //                 return 'Only letters are allowed';
            //               }
            //               return null;
            //             },
            //           ]),
            //       const SizedBox(height: 16),
            //       DropdownButtonFormField<String>(
            //         style: MyTextStyle(),
            //         decoration: MyInputDecoration(
            //           hintText: 'Gender',
            //           prefixIcon: const Icon(EvaIcons.gift),
            //         ),
            //         items: controller.genderOptions
            //             .map((gender) => DropdownMenuItem(
            //                   value: gender,
            //                   child: Text(gender),
            //                 ))
            //             .toList(),
            //         onChanged: (val) {
            //           controller.gender.text = val ?? '';
            //         },
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Gender is required';
            //           }
            //           return null;
            //         },
            //       ),
            //       const SizedBox(height: 16),
            //       //text area for bio
            //
            //       buildTextField(
            //           key: controller.bioKey,
            //           maxLines: 2,
            //           controller: controller.bio,
            //           hintText: 'Enter your bio',
            //           prefixIcon: const Icon(CupertinoIcons.infinite),
            //           validators: [
            //             (value) {
            //               if (value != null && value.length < 10) {
            //                 return 'Minimum 10 characters';
            //               }
            //               if (value != null && value.length > 100) {
            //                 return 'Maximum 100 characters';
            //               }
            //               return null;
            //             },
            //           ]),
            //       const SizedBox(height: 16),
            //       TextFormField(
            //         key: Key(controller.dobKey),
            //         controller: TextEditingController(
            //           text: controller.dob.value == null
            //               ? ''
            //               : controller.dob.value.toString().split(' ')[0],
            //         ),
            //         decoration: MyInputDecoration(
            //           hintText: 'Enter your date of birth',
            //           prefixIcon: const Icon(CupertinoIcons.calendar),
            //         ),
            //         style: MyTextStyle(),
            //         readOnly: true,
            //         onTap: () async {
            //           DateTime? pickedDate = await showDatePicker(
            //             context: context,
            //             initialDate: DateTime(2000),
            //             firstDate: DateTime(DateTime.now().year - 100),
            //             lastDate: DateTime(DateTime.now().year),
            //           );
            //           if (pickedDate != null) {
            //             controller.dob.value = pickedDate;
            //           }
            //         },
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Date of birth is required';
            //           }
            //           //if the dob is less than 10 years, return an error
            //           if (DateTime.now()
            //                   .difference(DateTime.parse(value))
            //                   .inDays <
            //               3650) {
            //             return 'You must be at least 10 years old';
            //           }
            //           return null;
            //         },
            //       ),
            //       const SizedBox(height: 16),
            //       PhoneInput(
            //         key: const Key('phone-field'),
            //         controller: controller.phonenumber,
            //         initialValue: null,
            //         shouldFormat: true,
            //         defaultCountry: IsoCode.US,
            //         decoration: MyInputDecoration(
            //           hintText: 'Enter your phone number',
            //         ),
            //         validator: PhoneValidator.validMobile(),
            //         isCountrySelectionEnabled: true,
            //         countrySelectorNavigator:
            //             const CountrySelectorNavigator.modalBottomSheet(
            //           favorites: [IsoCode.FR, IsoCode.DE, IsoCode.LK],
            //           searchInputDecoration: InputDecoration(
            //             hintText: 'Search for a country',
            //             prefixIcon: Icon(CupertinoIcons.search),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 16),
            //       buildTextField(
            //           onTap: () => Get.dialog(
            //                 FlutterMap(
            //                   options: const MapOptions(
            //                     initialCenter: LatLng(51.509364, -0.128928),
            //                     initialZoom: 9.2,
            //                   ),
            //                   children: [
            //                     TileLayer(
            //                       urlTemplate:
            //                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //                       userAgentPackageName: 'com.example.app',
            //                     ),
            //                     // CurrentLocationLayer(
            //                     //   alignPositionOnUpdate: AlignOnUpdate.always,
            //                     //   alignDirectionOnUpdate: AlignOnUpdate.never,
            //                     //   style: LocationMarkerStyle(
            //                     //     marker: const DefaultLocationMarker(
            //                     //       child: Icon(
            //                     //         Icons.navigation,
            //                     //         color: Colors.white,
            //                     //       ),
            //                     //     ),
            //                     //     markerSize: const Size(40, 40),
            //                     //     markerDirection: MarkerDirection.heading,
            //                     //   ),
            //                     // ),
            //                     RichAttributionWidget(
            //                       attributions: [
            //                         TextSourceAttribution(
            //                           'OpenStreetMap contributors',
            //                           onTap: () => launchUrl(Uri.parse(
            //                               'https://openstreetmap.org/copyright')),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //           key: controller.cityKey,
            //           hintText: 'Enter your city',
            //           controller: controller.city,
            //           prefixIcon: const Icon(CupertinoIcons.location),
            //           validators: [
            //             (value) {
            //               if (value == null || value.isEmpty) {
            //                 return 'City is required';
            //               }
            //               if (value.length < 3) {
            //                 return 'Minimum 3 characters';
            //               }
            //               if (value.length > 20) {
            //                 return 'Maximum 20 characters';
            //               }
            //               if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //                 return 'Only letters are allowed';
            //               }
            //               return null;
            //             },
            //           ]),
            //       const SizedBox(height: 16),
            //       buildTextField(
            //           key: controller.countryKey,
            //           hintText: 'Enter your country',
            //           controller: controller.country,
            //           prefixIcon: const Icon(CupertinoIcons.location),
            //           validators: [
            //             (value) {
            //               if (value == null || value.isEmpty) {
            //                 return 'Country is required';
            //               }
            //               if (value.length < 3) {
            //                 return 'Minimum 3 characters';
            //               }
            //               if (value.length > 20) {
            //                 return 'Maximum 20 characters';
            //               }
            //               if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            //                 return 'Only letters are allowed';
            //               }
            //               return null;
            //             },
            //           ]),
            //       const SizedBox(height: 16),
            //       SwitchListTile(
            //         title: const Text('Are you available?'),
            //         value: controller.available.value,
            //         onChanged: (value) {
            //           controller.available.value = value;
            //         },
            //         secondary: const Icon(CupertinoIcons.checkmark_seal),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
      // SliverPadding(
      //   padding: const EdgeInsets.all(pagePadding),
      //   sliver: SliverToBoxAdapter(
      //     child: controller.status == RxStatus.loading()
      //         ? const Center(child: CircularProgressIndicator())
      //         : MyButton(
      //             text: 'Create Profile',
      //             onTap: () {
      //               // if (controller.formKey.currentState?.validate() ?? false) {
      //               //   controller.createProfile();
      //               //   ScaffoldMessenger.of(context).showSnackBar(
      //               //     const SnackBar(content: Text('Processing Data')),
      //               //   );
      //               // } else {
      //               // //  formKey.
      //               //   ScaffoldMessenger.of(context).showSnackBar(
      //               //     const SnackBar(
      //               //         content: Text('Please fill all required fields')),
      //               //   );
      //               // }
      //             },
      //           ),
      //   ),
      // ),
    ],
  );
}
