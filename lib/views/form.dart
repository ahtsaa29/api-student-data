import 'package:dataapp/services/remoteservices.dart';
import 'package:dataapp/views/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormView extends StatelessWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please fill up the form",
              textScaleFactor: 1.4,
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Name goes here",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Age",
                    ),
                  ),
                  SizedBox(
                    width: Get.size.width * 0.8,
                    child: ElevatedButton(
                      child: const Text("Add Student"),
                      onPressed: () async {
                        Map student = {
                          "name": nameController.text,
                          "age": ageController.text
                        };
                        RemoteServices.postStudent(student);
                        print(student);
                        Get.snackbar("success", "Student added successfulyy");
                        nameController.text = "";
                        ageController.text = "";
                        FocusScope.of(context).unfocus();
                        Get.offAll(const DataView());
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
