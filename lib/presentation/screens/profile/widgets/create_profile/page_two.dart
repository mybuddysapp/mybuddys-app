import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage page2(
  BuildContext context,
  ValueNotifier<int> pageIndexNotifier,
) {
//   final profileProvider = ref.watch(playerProfileProvider.notifier);
//   final playerProfile = ref.watch(playerProfileProvider);
  final formKey = GlobalKey<FormState>();

  //username field must check with the backend if the username is already taken

  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final textTheme = Theme.of(context).textTheme;

  return SliverWoltModalSheetPage(
    // hasSabGradient: true,
    enableDrag: true,
    resizeToAvoidBottomInset: true,
    pageTitle: Padding(
      padding: const EdgeInsets.all(pagePadding),
      child: Text(
        'Player Profile',
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    // a default profile image from internet
    // heroImageHeight: _heroImageHeight,
    // heroImage: Image.network(
    //   'https://picsum.photos/250/250',
    //   height: _heroImageHeight,
    //   fit: BoxFit.cover,
    // ),
    leadingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(pagePadding),
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value - 1,
    ),
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(pagePadding),
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
    ),
    mainContentSlivers: [
      const SliverSafeArea(
        sliver: SliverToBoxAdapter(
          child: Column(
            children: [
              Text('Create your Player Profile'),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                ),
              ),
            ],
          ),
        ),
        //a button to create profile
      ),
      SliverToBoxAdapter(
        key: UniqueKey(),
        child: FormBuilder(
          key: UniqueKey(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //username field must check with the backend if the username is already taken
              FormBuilderTextField(
                name: 'username',
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "username not available"),
                  FormBuilderValidators.minLength(3),
                  FormBuilderValidators.maxLength(20),
                  // FormBuilderValidators.numeric(),
                ]),
                enabled: true,
                onChanged: (value) async {
                  // final isAvailable =
                  //     await profileProvider.checkUsername(value!);
                  // debugPrint('isAvailable: $isAvailable');
                  // if (isAvailable) {
                  //   //username is available
                  //   //enable the submit  button
                  //   // context.widget.controller
                  // } else {
                  //username is not available
                  //disable the submit button
                  // }
                },
              ),

              FormBuilderTextField(
                name: "firstname",
                decoration: const InputDecoration(
                  hintText: 'Enter your first name',
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: "First name is required"),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(20),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                child: const Text('Upload Picture'),
              ),
              const SizedBox(height: 16),
              const Text('Bio'),
              const SizedBox(height: 8),
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write a short bio about yourself',
                ),
              ),
            ],
          ),
        ),
      ),
      // SliverGrid(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     mainAxisSpacing: 10.0,
      //     crossAxisSpacing: 10.0,
      //     childAspectRatio: 2.0,
      //   ),
      //   delegate: SliverChildBuilderDelegate(
      //     (_, index) => ColorTile(color: materialColorsInGrid[index]),
      //     childCount: materialColorsInGrid.length,
      //   ),
      // ),
      // SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //     (_, index) => ColorTile(color: materialColorsInSliverList[index]),
      //     childCount: materialColorsInSliverList.length,
      //   ),
      // ),
      // ...materialColorsInSpinner
      //     .map((e) => Shifter(child: ColorTile(color: e)))
      //     .toList(),
      SliverPadding(
        padding: const EdgeInsets.all(pagePadding),
        sliver: SliverToBoxAdapter(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: Navigator.of(context).pop,
            child: const Text('Create Profile'),
          ),
        ),
      ),
    ],
  );
}
