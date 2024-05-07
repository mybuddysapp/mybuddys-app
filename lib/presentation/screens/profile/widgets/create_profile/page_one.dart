import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

typedef HandlePseudoSubmit = void Function(String pseudonym);

SliverWoltModalSheetPage page1(
  BuildContext context,
  ValueNotifier<int> pageIndexNotifier,
) {
  final textTheme = Theme.of(context).textTheme;
  final controller = Get.find<ProfileController>();
  final psuedonym = controller.pseudonymController.value;

  return SliverWoltModalSheetPage(
    enableDrag: true,
    resizeToAvoidBottomInset: true,
    pageTitle: Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Text(
        'Player Profile',
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    hasSabGradient: true,
    stickyActionBar: Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Column(
        children: [
          // const SizedBox(height: 8),
          controller.isPseudoAvailable.value
              ? ElevatedButton(
                  onPressed: () =>
                      pageIndexNotifier.value = pageIndexNotifier.value + 1,
                  child: const SizedBox(
                    height: buttonHeight,
                    width: double.infinity,
                    child: Center(
                      child: Text('Let\'s get started!'),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    ),
    topBarTitle:
        Text('choose_player_psuedonym'.tr, style: textTheme.titleLarge),
    isTopBarLayerAlwaysVisible: true,
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(pagePadding),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(context).pop,
    ),
    mainContentSlivers: [
      SliverSafeArea(
        sliver: SliverToBoxAdapter(
          child: Column(
            children: [
              const Text(
                '''
                Your profile is your identity on MyBuddys. It's a way for you to express yourself and help others understand who you are.
                your profile will be used to match you with other players and events.
                
                don't forget to choose a profile picture and write a short bio about yourself, so others can get to know you better.
                
                Don't worry, you can always edit your profile later.
                
                Let's get started!
                ''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  wordSpacing: 1.5,
                  leadingDistribution: TextLeadingDistribution.proportional,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              const Text("Let's create a pseudonyme for your profile:)"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  //add a icon to reset the field

                  controller: controller.pseudonymController,
                  style: textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText:
                        'Try your best pseudonyme here ... ex: TheBadassPlayer',
                  ),
                  scrollPadding: const EdgeInsets.only(bottom: 600),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) async {
                    controller.handlePseudonymSubmit();
                  },
                ),
                // a subit button to check if the username is available
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Obx(
                () => controller.isPseudoAvailable.value
                    ? ElevatedButton(
                        onPressed: () => pageIndexNotifier.value =
                            pageIndexNotifier.value + 1,
                        child: const SizedBox(
                          height: buttonHeight,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Let\'s get started!',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Text(
                        'No it is not working',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            ],
          ),
        ),
      ),
      // const SliverPadding(padding: EdgeInsets.only(bottom: 50)),
    ],
  );
}
