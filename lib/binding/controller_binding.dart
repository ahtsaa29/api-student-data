import 'package:dataapp/controller/student_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
  }
}
