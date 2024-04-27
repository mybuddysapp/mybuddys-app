import 'package:auth_provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/auth/controllers/auth.controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.putAsync<AppwriteAuthProvider>(
    //   () async {
    //     final instance = AppwriteAuthProvider();
    //     await instance.init();
    //     return instance;
    //   },
    //   permanent: true,
    // );
    // Get.put<AppwriteAuthProvider>(
    //   AppwriteAuthProvider(),
    //   permanent: true,
    // );
    Get.lazyPut<AuthScreenController>(
      () => AuthScreenController(),
      fenix: true,
    );
  }
}
