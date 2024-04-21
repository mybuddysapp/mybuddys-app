import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/teams/controllers/teams.controller.dart';

class TeamsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamsController>(
      () => TeamsController(),
    );
  }
}
