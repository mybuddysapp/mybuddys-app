import 'dart:async';

import 'package:auth_provider/auth_provider.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/address/address.dart';
import 'package:mybuddys/app/data/models/player/create_player.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/app/data/providers/address_provider.dart';
import 'package:mybuddys/app/data/providers/profile_provider.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';

class PlayerProfileFormController extends GetxController
    with StateMixin<Player> {
  final formKey = GlobalKey<FormState>(debugLabel: 'page2Z');

  // Text editing controllers
  final dob = Rxn<DateTime>();
  final available = true.obs;
  final TextEditingController bio = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final phonenumber = TextEditingController();

  final selectedCountry = ''.obs;

  // Gender options
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  // Profile provider instance
  final ProfileProvider profileProvider = ProfileProvider();

  // Form field keys
  final firstnameKey = 'firstname';
  final lastnameKey = 'lastname';
  final bioKey = 'bio';
  final phoneKey = const Key('phone');
  final dobKey = 'dob';
  final availableKey = 'available';
  final cityKey = 'city';
  final countryKey = 'country';
  final genderKey = 'gender';
  final pseudo = ''.obs;

  var isoCode = 'FR'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    pseudo.value = Get.find<CreateProfileController>().pseudonym.text;

    super.onInit();
  }

  PlayerProfileFormController(Player? player) {
    if (player != null) {
      pseudo.value = player.pseudonym;
      firstname.text = player.firstname;
      lastname.text = player.lastname;
      bio.text = player.bio!;
      city.text = player.address!.split(",")[0];
      country.text = player.address!.split(",")[1];
      gender.text = player.gender;
      phonenumber.text = player.phone ?? '';
      isoCode.value = player.phone?.split(" ")[0] ?? 'FR';
      dob.value = DateTime.parse(player.dob);
      available.value = player.available!;
      selectedCountry.value = player.address!.split(",")[1];
    }
  }

  Future<String> _getIsoCodeFromCountry(String country) async {
    final countries = await csc.getAllCountries();

    final selectedCountry =
        countries.firstWhere((element) => element.name == country);
    return selectedCountry.isoCode;
  }

  Future<void> onCountryChanged(String value) async {
    selectedCountry.value = value;
    country.text = value;
    city.text = '';
  }

  Future<List<String>> getCountries(String pattern) async {
    final countries = await csc.getAllCountries();
    return countries
        .where((country) =>
            country.name.toLowerCase().contains(pattern.toLowerCase()))
        .map((country) => country.name)
        .toList();
  }

  Future<List<csc.City>> getCities() async {
    final countries = await csc.getAllCountries();
    final csc.Country countryCode =
        countries.firstWhere((element) => element.name == country.text);
    final cities = await csc.getCountryCities(countryCode.isoCode);
    return cities;
  }

  FutureOr<List<String>?> countrySuggestionsCallback(String search) {
    return getCountries(search);
  }

  Future<void> handleOnSelectedCountry(String value) async {
    country.text = value;
    isoCode.value = await _getIsoCodeFromCountry(value);
  }

  Future<List<csc.City>?> citySuggestionsCallback(String search) async {
    final cities = await getCities();
    return cities
        .where((city) => city.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  Future<void> testIfCityBelongsToCountry() async {
    if (city.text.isNotEmpty && country.text.isNotEmpty) {
      final cities = await getCities();
      cities.firstWhere((element) => element.name == city.text, orElse: () {
        throw Exception('City not found');
      });
    }
  }

  // Creates a new address
  Future<Address?> _createAddress(String city, String country) async {
    print('Creating address');
    try {
      final response = await AddressProvider().createAddress(city, country);
      return response;
    } catch (e) {
      print(e);
      logger.e('Error creating address: $e');
    }
    return null;
  }

  // Creates a new profile
  Future<void> createProfile() async {
    print('Creating profile');

    change(null, status: RxStatus.loading());
    try {
      final userId = Get.find<AuthAPI>().userId;
      final address = await _createAddress(city.text, country.text);
      //
      final CreatePlayer player = CreatePlayer(
        id: userId!,
        pseudonym: pseudo.value,
        bio: bio.text,
        firstname: firstname.text,
        lastname: lastname.text,
        phone: phonenumber.text,
        dob: dob.value.toString().split(" ")[0],
        available: available.value,
        address: address?.id,
        gender: gender.text.toUpperCase(),
      );
      //
      logger.i(player);
      final response = await profileProvider.createProfile(player);
      print(response);
      change(response, status: RxStatus.success());
      logger.i('Profile created');
    } catch (e) {
      print(e);
      logger.e('Error creating profile: $e');
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
