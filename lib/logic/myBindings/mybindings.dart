import 'package:e_nurse_jobs/logic/controllers/nurse_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
    );
    /////////
    Get.lazyPut(() => NurseController(), fenix: true);
  }
}
