import 'package:auth_provider/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mybuddys/app/data/services/api_service.dart';

class RootController extends GetxController {
  AuthAPI authAPI = Get.find<AuthAPI>();

  get status => authAPI.status;

  // var state = authAPI.status;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // ApiService apiService = ApiService(Dio());
    // final logger = Logger();
    // apiService.getPlayers().then((value) => logger.d(value));
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getPlayers() async {

    final logger = Logger();
    print("getPlayers");

  }
}
