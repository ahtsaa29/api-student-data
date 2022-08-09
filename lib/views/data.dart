import 'package:dataapp/views/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/student_controller.dart';

class DataView extends StatelessWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sc = Get.find<StudentController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.off(const FormView());
            },
            child: const Text("Add Student"),
          )
        ],
      ),
      body: Obx(() {
        if (sc.isLoading == true) {
          return const Center(
            child: LinearProgressIndicator(),
          );
        } else {
          return Center(
            child: Column(
              children: [
                const Text("StudentData"),
                DataTable(
                  columns: const [
                    DataColumn(
                      label: Text("id"),
                    ),
                    DataColumn(
                      label: Text("Name"),
                    ),
                    DataColumn(
                      label: Text("Age"),
                    ),
                  ],
                  rows: List.generate(sc.studentList.length, (index) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(sc.studentList[index].id.toString()),
                        ),
                        DataCell(
                          Text(sc.studentList[index].name),
                        ),
                        DataCell(
                          Text(sc.studentList[index].age),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          );
        }
      }),
    ));
  }
}
