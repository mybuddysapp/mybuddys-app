import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:mybuddys/presentation/components/my_button.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/page_one.controller.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import 'create_profile_sliver.dart';

typedef HandlePseudoSubmit = void Function(String pseudonym);

SliverWoltModalSheetPage page1(
  BuildContext context,
  // GlobalKey<FormState> formKey,
) {
  final textTheme = Theme.of(context).textTheme;
  final controller = Get.find<PageOneController>();

  return SliverWoltModalSheetPage(
    resizeToAvoidBottomInset: true,
    pageTitle: Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Center(
        child: Text(
          'Psuedonyme Creation',
          style:
              textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    trailingNavBarWidget: WoltModalSheetCloseButton(
      onClosed: () {
        Navigator.of(context).pop();
      },
    ),
    mainContentSlivers: [
      SliverToBoxAdapter(
        key: const Key('page1'),
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '''Your profile is your identity on MyBuddys. It's a way for you to express yourself and help others understand who you are. Your profile will be used to match you with other players and events.

Don't forget to choose a profile picture and write a short bio about yourself, so others can get to know you better. Don't worry, you can always edit your profile later.

''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  wordSpacing: 1.5,
                  leadingDistribution: TextLeadingDistribution.proportional,
                ),
              ),
              const Text("Let's create a pseudonym for your profile:)"),
              Obx(
                () => Column(
                  children: [
                    // Form(
                    //   key: controller.formKey,
                    //   child: buildTextField(
                    //     key: controller.pseudoKey,
                    //     controller: controller.pseudonymController,
                    //     hintText: 'Pseudonym',
                    //     validators: [
                    //       (value) => value!.isEmpty ? 'Email is required' : null,
                    //       (value) =>
                    //           !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                    //               ? 'Invalid email address'
                    //               : null,
                    //     ],
                    //     onTap: () => controller.handlePseudoSearch(),
                    //     onSubmitted: (value) async {
                    //       if (controller.formKey.currentState!.validate()) {
                    //         controller.handlePseudoSearch();
                    //       }
                    //     },
                    //   ),
                    // ),
                    TextFormField(
                      key: const Key('pseudoField'),
                      controller: controller.pseudonymController,
                      decoration: controller.buildInputDecoration(),
                      onChanged: (value) => controller.handleOnChanged(value),
                      textInputAction: TextInputAction.search,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pseudonym is required';
                        }
                        if (value.length < 3) {
                          return 'Minimum 3 characters';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          logger.i('Invalid email address');
                          return 'Invalid email address';
                        }
                        // ? 'Invalid email address'
                        // : null;
                        return null;
                      },
                      onFieldSubmitted: (value) async {
                        controller.handlePseudoSearch();
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        key: const Key('pseudoSubmit'),
        child: Obx(() {
          final isAvailable = controller.isPseudoAvailable.value;
          if (isAvailable == null) return const SizedBox();
          if (isAvailable) {
            return Padding(
              padding: const EdgeInsets.all(pagePadding),
              child: MyButton(
                text: 'Let\'s get started!',
                onTap: controller.handlePseudoSubmit,
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    ],
  );
}
