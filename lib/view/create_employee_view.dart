import 'package:crud_mongodb_frontend/resources/components/reusable_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_mongodb_frontend/resources/components/reusable_text_feild.dart';
import 'package:crud_mongodb_frontend/view_model/employees_view_model.dart';
import 'package:crud_mongodb_frontend/model/employee_model.dart';

class CreateEmployeeView extends StatelessWidget {
  CreateEmployeeView({super.key});

  final EmployeesViewModel _employeesViewModel = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController dojController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Employee"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReusableTextFeild(
              hintText: "Name",
              controller: nameController,
            ),
            ReusableTextFeild(
              hintText: "Email",
              controller: emailController,
            ),
            ReusableTextFeild(
              hintText: "Mobile",
              controller: mobileController,
              keyboardType: TextInputType.number,
            ),
            ReusableTextFeild(
              hintText: "Date of Birth (dd-mm-yyyy)",
              controller: dobController,
            ),
            ReusableTextFeild(
              hintText: "Date of Joining (dd-mm-yyyy)",
              controller: dojController,
            ),
            const SizedBox(height: 20),
            ReuseableElevatedbutton(
              buttonName: "Create Employee",
              onPressed: () {
                final employee = EmployeeModel(
                  name: nameController.text,
                  email: emailController.text,
                  mobile: mobileController.text,
                  dob: dobController.text,
                  doj: dojController.text,
                );

                _employeesViewModel.createEmployee(context, employee);
              },
            )
          ],
        ),
      ),
    );
  }
}
