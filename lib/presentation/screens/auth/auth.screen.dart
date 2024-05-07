import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lo_form/lo_form.dart';
import 'package:mybuddys/presentation/components/my_button.dart';
import 'package:mybuddys/presentation/components/my_sliver_app_bar.dart';

import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthScreenController> {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: UniqueKey(),
        slivers: [
          Obx(
            () => MySliverAppBar(
              title: controller.title.value,
              avatarIcon: controller.appBarAvatarIcon(),
              rightIconWidget: IconButton(
                icon: controller.appBarIcon(),
                onPressed: () => controller.handleOnClick(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    // offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(
                      () => controller.isLogin.value
                          ? _loginForm()
                          : _registerForm(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: TextButton(
                onPressed: () => controller.onGoogleSignIn(),
                child: const Text('Google login'),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _loginForm() {
    return LoForm<String>(
      key: controller.loginFormKey,
      // onReady: controller.loginFormState,
      // onChanged: controller.loginFormState,
      submittableWhen: (status) => status.isValid || status.isSubmitted,
      onSubmit: (values, setErrors) =>
          controller.onLoginSubmit(values, setErrors),
      builder: (form) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              key: controller.emailKey,
              validators: [
                LoRequiredValidator('Email is required'.tr),
                LoRegExpValidator.email('Invalid email address'),
              ],
              // initialValue: 'Username',
              // hintText: 'Username or Email',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              key: controller.passwordKey,
              // hintText: 'Password',
              isPassword: true,
              validators: [
                LoRequiredValidator('Password is required'.tr),
              ],
            ),
            const SizedBox(height: 16),
            MyButton(
              onTap: () => form.submit!(),
              text: 'Login',
              isDisabled: !form.status.isValid,
            ),
          ],
        );
      },
    );
  }

  Widget _registerForm() {
    return LoForm<String>(
      key: controller.registerFormKey,
      // onReady: controller.registerFormState,
      // onChanged: controller.registerFormState,
      submittableWhen: (status) => status.isValid || status.isSubmitted,
      validators: [
        LoMatchValidator('Password', 'Confirm'),
        LoFormValidator(
          (values) {
            final username = values.get('Username');
            return {
              if (username == 'whoami') 'Username': 'Who are you?',
            };
          },
        ),
      ],
      onSubmit: (values, setErrors) =>
          controller.onRegisterSubmit(values, setErrors),
      builder: (form) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              key: 'Email Address',
              validators: [
                LoFieldValidator(
                  (v) => v == 'whoami' ? 'Who are you?' : null,
                ),
                //only alow letters and numbers and underscore and no spaces allowed
                LoRegExpValidator.email(
                  'Invalid email address',
                ),
                LoRequiredValidator('Email is required'.tr),
              ],
              // initialValue: 'Username',
              // hintText: 'Username or Email',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              key: controller.passwordKey,
              // hintText: 'Password',
              isPassword: true,

              validators: [
                LoRegExpValidator(
                  r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                  'Password must contain at least 8 characters, including letters and numbers',
                ),
                LoRequiredValidator('Password is required'.tr),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField(
              key: controller.confirmPasswordKey,
              hintText: 'Confirm Password',
              isPassword: true,
            ),
            const SizedBox(height: 16),
            LoCheckbox(
              loKey: controller.agreementKey,
              label: const Text('I agree to all the terms and conditions'),
              validators: [
                LoFieldValidator((v) => v != true ? 'Required' : null),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: form.submit,
              child: const Text('Register'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    LoForm<String>? form,
    required String key,
    String? initialValue,
    String? hintText,
    bool isPassword = false,
    List<LoFieldBaseValidator<String>>? validators,
  }) {
    return LoTextField(
      loKey: key,
      initialValue: initialValue,
      validators: validators,
      debounceTime: const Duration(milliseconds: 500),
      props: TextFieldProps(
        autofocus: false,
        obscureText: isPassword,
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 2.0,
          fontFamily: GoogleFonts.abel().fontFamily,
          overflow: TextOverflow.ellipsis,
          decoration: TextDecoration.none,
        ),

        // style: TextStyle(
        //   color: Colors.black,
        //   letterSpacing: 2.0,
        //   fontFamily: GoogleFonts.abel().fontFamily,
        //   overflow: TextOverflow.ellipsis,
        //   decoration: TextDecoration.none,
        // ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),

          labelStyle: const TextStyle(color: Colors.teal),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(color: Colors.teal),
          // errorStyle: const TextStyle(color: Colors.blue),
          prefixIconColor: Colors.grey[600],
          prefix: key == 'Username'
              ? const Icon(CupertinoIcons.person)
              : const Icon(CupertinoIcons.lock),
          // prefixIconConstraints:
          //     const BoxConstraints(minWidth: 0, minHeight: 0),
          labelText: key,
          filled: true,
          fillColor: Colors.grey[200],
          // Grey background color
          // contentPadding:
          //     const EdgeInsets.fromLTRB(16, 1, 16, 26),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          helperMaxLines: 3,
          errorMaxLines: 3,
          // error: const Text('ErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorError'),
          // error: Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.red[100],
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          // ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
            borderSide: BorderSide(color: Colors.transparent), // No border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
            borderSide: BorderSide(color: Colors.transparent), // No border
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
            borderSide: BorderSide(color: Colors.red), // Error border color
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
            borderSide: BorderSide(color: Colors.red), // Error border color
          ),
        ),
      ),
    );
  }
}
