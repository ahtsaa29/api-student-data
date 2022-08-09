import 'package:dataapp/model/student_model.dart';
import 'package:dataapp/services/remoteservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  var studentList = <StudentModel>[].obs;
  var isLoading = true.obs;

  Future<List<StudentModel>?> fetchStudentList() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchStudent();

      if (data != null) {
        studentList.value = data;
      } else {
        return null;
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Controller error",
        content: Text(e.toString()),
      );
    } finally {
      isLoading(false);
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    fetchStudentList();
  }
}
