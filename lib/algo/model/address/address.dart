import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.g.dart';
part 'address.freezed.dart';

@freezed
class Address with _$Address {
  factory Address({
    required String id,
    required String street,
    required String city,
    String? state,
    required String zip,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
