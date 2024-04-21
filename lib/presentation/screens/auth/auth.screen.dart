import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mybuddys/presentation/components/my_sliver_app_bar.dart';

import '../../components/my_button.dart';
import '../../components/my_rich_text.dart';
import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthScreenController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            title: 'Log In.',
            avatarIcon: Icons.follow_the_signs,
            leftIconWidget: IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_down_circle_fill,
                color: Colors.white,
              ),
              onPressed: () {
                //TODO implement anonumous usage of the app limiting the features
              },
            ),
            rightIconWidget: IconButton(
              icon: const Icon(
                CupertinoIcons.person_badge_plus_fill,
                color: Colors.white,
              ),
              onPressed: () {
                // controller.navigateToSignUp();
              },
            ),
          ),
          SliverFillRemaining(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 200,
                  //   width: MediaQuery.of(context).size.width * 0.8,
                  //   margin: EdgeInsets.only(
                  //       left: MediaQuery.of(context).size.width * 0.09),
                  //   child: Image.asset("assets/images/login.png"),
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  // CustomFormField(
                  //   headingText: "Email",
                  //   hintText: "Email",
                  //   obsecureText: false,
                  //   suffixIcon: const SizedBox(),
                  //   controller: controller.emailController,
                  //   maxLines: 1,
                  //   textInputAction: TextInputAction.done,
                  //   textInputType: TextInputType.emailAddress,
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  // CustomFormField(
                  //   headingText: "Password",
                  //   hintText: "Password",
                  //   obsecureText: true,
                  //   suffixIcon: const SizedBox(),
                  //   controller: controller.passwordController,
                  //   maxLines: 1,
                  //   textInputAction: TextInputAction.done,
                  //   textInputType: TextInputType.visiblePassword,
                  // ),

                  const SizedBox(
                    height: 24,
                  ),
                  //google signin
                  IconButton(
                    onPressed: () {
                      controller.authController.googleSignIn();
                    },
                    icon: const Icon(
                      Iconsax.add_bulk,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: RichText(
                        text: TextSpan(
                          text: 'Forgot Password?',
                          style: Get.textTheme.bodyText1!
                              .copyWith(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) => const SignUp()));
                            },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyButton(
                    text: 'Log In',
                    onTap: () {
                      controller.onLogin();
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyRichText(
                    discription: "Don't already Have an account? ",
                    text: 'Sign Up',
                    onTap: () {
                      // controller.navigateToSignUp();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}