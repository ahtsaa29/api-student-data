import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/student_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<StudentModel>?> fetchStudent() async {
    try {
      var response =
          await client.get(Uri.parse("http://192.168.0.129:3000/students"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return studentModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Remote service error",
        content: Text(e.toString()),
      );
    }
    return null;
  }

  static Future<List<StudentModel>?> postStudent(Map student) async {
    try {
      var response = await client.post(
        Uri.parse("http://192.168.0.129:3000/students"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(student),
      );
    } catch (e) {
      Get.defaultDialog(title: "Post error", content: Text(e.toString()));
    }
    return null;
  }
}
