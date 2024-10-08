import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Add this for SliverGrid
import 'package:flutter/rendering.dart'; // Import this for SliverGrid
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:mybuddys/presentation/screens/profile/widgets/create_profile/page_one.dart';
import 'package:mybuddys/presentation/screens/profile/widgets/create_profile/page_two.dart';

import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CreateProfileSliver extends StatelessWidget {
  const CreateProfileSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);

    final textTheme0 = Theme.of(context).textTheme;

    // final currentUser = ref.read(authProvider);

    // final isPseudoAvailable = ValueNotifier(false);

    final isPseudoAvailable = useState<Future<bool>?>(Future.value(false));
    // We listen to the pending operation, to update the UI accordingly.
    final snapshot = useFuture(isPseudoAvailable.value);

    var isOk = false.obs;

    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme0.titleLarge,
                  children: const [
                    TextSpan(
                      text: 'You have not yet created your ',
                    ),
                    TextSpan(
                      text: 'Player',
                      style: TextStyle(
                          color: Colors.red), // Apply red color to "Player"
                    ),
                    TextSpan(
                      text: ' profile',
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                WoltModalSheet.show(
                  context: context,
                  pageIndexNotifier: pageIndexNotifier,
                  pageListBuilder: (modalSheetContext) {
                    return [
                      page1(
                        modalSheetContext, pageIndexNotifier,
                        //   (String pseudonym) async {
                        // final provider = ref
                        //     .read(playerProfileProvider.notifier)
                        //     .checkUsername(pseudonym);
                        // isPseudoAvailable.value = provider;
                        // debugPrint('isAvailable: $isPseudoAvailable');
                        // if (pseudonym == 'test') {
                        //   isOk.value = true;
                        // } else {
                        //   isOk.value = false;
                        // }
                        // }, isOk,
                      ),
                      page2(
                        modalSheetContext,
                        pageIndexNotifier,
                      ),
                    ];
                  },
                  modalTypeBuilder: (context) {
                    final size = MediaQuery.of(context).size.width;
                    return size < pageBreakpoint
                        ? WoltModalType.bottomSheet
                        : WoltModalType.dialog;
                  },
                  onModalDismissedWithBarrierTap: () {
                    debugPrint('Closed modal sheet with barrier tap');
                    Navigator.of(context).pop();
                    pageIndexNotifier.value = 0;
                  },
                );
              },
              child: SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: Center(
                  child: Text(
                    'create player profile'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  bounce: true,
                  expand: true,
                  enableDrag: true,
                  context: context,
                  builder: (context) => Scaffold(
                    body: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('This is a modal efzerngo sheet'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("close"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text("modal sheet with text field"),
            ),
          ],
        ),
      ),
    );
  }
}

//page 1

//page 2

class SheetPageWithTextField {
  SheetPageWithTextField._();

  static WoltModalSheetPage build(
    BuildContext context, {
    required int currentPage,
    bool isLastPage = true,
  }) {
    ValueNotifier<bool> isButtonEnabledNotifier = ValueNotifier(false);
    final textEditingController = TextEditingController();
    textEditingController.addListener(() {
      isButtonEnabledNotifier.value = textEditingController.text.isNotEmpty;
    });
    return WoltModalSheetPage(
      stickyActionBar: ValueListenableBuilder<bool>(
        valueListenable: isButtonEnabledNotifier,
        builder: (_, isEnabled, __) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ElevatedButton(
              onPressed: () {},
              // isLastPage
              // ? cubit.closeSheet
              // : () => cubit.goToPage(currentPage + 1),
              child: Text(
                !isEnabled
                    ? "Fill the text field to enable"
                    : (isLastPage ? "Submit" : "Next"),
              ),
            ),
          );
        },
      ),
      hasTopBarLayer: false,
      topBarTitle: Text('Page with text field'),
      isTopBarLayerAlwaysVisible: true,
      leadingNavBarWidget: WoltModalSheetBackButton(
        onBackPressed: () => null,
      ),
      trailingNavBarWidget: WoltModalSheetCloseButton(onClosed: () {}),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 80, top: 16, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              '''
This page has a text field and always visible top bar title. We wait for the keyboard closing before starting pagination. Don't forget to add a scroll padding to your text field to avoid the keyboard hiding the text field.
''',
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextFormField(
                autofocus: false,
                maxLines: 3,
                controller: textEditingController,
                // scrollPadding: const EdgeInsets.only(top: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WoltModalSheetCloseButton extends StatelessWidget {
  const WoltModalSheetCloseButton({this.onClosed, super.key});

  final VoidCallback? onClosed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: Semantics(
        label: semanticsLabel(context),
        container: true,
        button: true,
        child: ExcludeSemantics(
          child: WoltCircularElevatedButton(
            onPressed: onClosed ?? Navigator.of(context).pop,
            icon: Icons.close,
          ),
        ),
      ),
    );
  }

  String semanticsLabel(BuildContext context) {
    return Localizations.of<MaterialLocalizations>(
                context, MaterialLocalizations)
            ?.closeButtonLabel ??
        const DefaultMaterialLocalizations().closeButtonLabel;
  }
}

class WoltCircularElevatedButton extends StatelessWidget {
  const WoltCircularElevatedButton(
      {required this.onPressed, required this.icon, super.key});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.black;
    const fillColor = Colors.black12;
    return RawMaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      fillColor: fillColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: iconColor.withOpacity(.1),
      splashColor: iconColor.withOpacity(.1),
      constraints: const BoxConstraints.expand(width: 40, height: 40),
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Icon(icon, size: 24.0, color: Colors.black),
    );
  }
}

class WoltModalSheetBackButton extends StatelessWidget {
  const WoltModalSheetBackButton({required this.onBackPressed, super.key});

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Semantics(
        label: semanticsLabel(context),
        container: true,
        button: true,
        child: ExcludeSemantics(
          child: WoltCircularElevatedButton(
              onPressed: onBackPressed, icon: Icons.arrow_back_rounded),
        ),
      ),
    );
  }

  String semanticsLabel(BuildContext context) {
    return Localizations.of<MaterialLocalizations>(
                context, MaterialLocalizations)
            ?.backButtonTooltip ??
        const DefaultMaterialLocalizations().backButtonTooltip;
  }
}
