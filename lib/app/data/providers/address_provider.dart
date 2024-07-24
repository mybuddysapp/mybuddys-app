import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/address/address.dart';
import 'package:mybuddys/config.dart';

class AddressProvider extends GetConnect {
  final String url = ConfigEnvironments.getEnvironments()['url']!;

  @override
  void onInit() {
    httpClient.baseUrl = url;
    httpClient.defaultContentType = "application/json";
  }

  Future<Address?> createAddress(String city, String country) async {
    final res = await post(
      '$url/address/',
      {
        'city': city,
        'country': country,
      },
    );

    if (res.hasError) {
      if (res.statusCode == 404) {
        return null;
      } else {
        throw Exception(res.statusText);
      }
    } else {
      return Address.fromJson(res.body);
    }
  }

  Future<Address?> getAddress(int id) async {
    final response = await get('$url/address/$id');
    if (response.hasError) {
      throw Exception(response.statusText ?? 'Error fetching address');
    }
    return response.body;
  }
}
