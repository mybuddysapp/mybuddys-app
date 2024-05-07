import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  final String pseudonym;

  CreateProfileController({required this.pseudonym});

  final TextEditingController bioController = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final phoneController = TextEditingController();
  final available = true.obs;
  final dob = DateTime.now().obs;//a changer

  void handleProfileSubmit() {

  }



}
