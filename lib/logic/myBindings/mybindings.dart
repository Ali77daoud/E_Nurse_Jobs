import 'package:e_nurse_jobs/logic/controllers/nurse_controller.dart';
import 'package:e_nurse_jobs/logic/controllers/patient_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/caring_controller.dart';
import '../controllers/caring_type_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
    );
    /////////
    Get.lazyPut(() => NurseController(), fenix: true);
    /////////
    Get.lazyPut(() => PatientController(), fenix: true);
    /////////
    Get.lazyPut(() => CaringTypeController(), fenix: true);
    /////////
    Get.lazyPut(() => CaringController(), fenix: true);
  }
}
