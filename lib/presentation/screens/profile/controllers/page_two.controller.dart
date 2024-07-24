import 'package:auth_provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/address/address.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/app/data/providers/address_provider.dart';
import 'package:mybuddys/app/data/services/location.service.dart';

class PageTwoController extends GetxController with StateMixin<Player> {
  // Observable variables
  final pseudo = 'pseudo'.obs;

  //give a null value to dob
  //
  // final formKey = GlobalKey<FormState>(debugLabel: 'page2');
  //
  // // Text editing controllers
  // final available = true.obs;
  // final dob = Rxn<DateTime>();
  // final TextEditingController bio = TextEditingController();
  // final TextEditingController firstname = TextEditingController();
  // final TextEditingController lastname = TextEditingController();
  // final TextEditingController city = TextEditingController();
  // final TextEditingController country = TextEditingController();
  // final TextEditingController gender = TextEditingController();
  // final phonenumber = PhoneController(const PhoneNumber(isoCode: IsoCode.FR, nsn: ''));
  // // Gender options
  // final List<String> genderOptions = ['Male', 'Female', 'Other'];
  //
  // // Profile provider instance
  // final ProfileProvider profileProvider = ProfileProvider();
  // // final formKey = GlobalKey<FormState>();
  //
  //
  // // Form field keys
  // final firstnameKey = 'firstname';
  // final lastnameKey = 'lastname';
  // final bioKey = 'bio';
  // final phoneKey = 'phone';
  // final dobKey = 'dob';
  // final availableKey = 'available';
  // final cityKey = 'city';
  // final countryKey = 'country';
  // final genderKey = 'gender';

  // Handles form submission
  Future<bool> onSubmit(Map<String, dynamic> values,
      void Function(Map<String, String?>) setErrors) async {
    print(values);
    return true;
  }

  @override
  void onClose() {
    // Dispose controllers to free up resources
    super.onClose();
    // bio.dispose();
    // firstname.dispose();
    // lastname.dispose();
    // city.dispose();
    // country.dispose();
    // gender.dispose();
    // phonenumber.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => LocationService());
  }

  @override
  void onReady() {
    super.onReady();
    final locationService = Get.find<LocationService>();
  }
}
