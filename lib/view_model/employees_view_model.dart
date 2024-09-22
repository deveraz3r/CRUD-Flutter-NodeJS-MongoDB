import 'dart:math';

import 'package:crud_mongodb_frontend/model/employee_model.dart';
import 'package:crud_mongodb_frontend/repository/employees_repo.dart';
import 'package:crud_mongodb_frontend/data/response/api_response.dart';
import '../data/app_exceptions.dart';
import '../utils/app_urls.dart';

class EmployeesViewModel extends GetxController {
  final EmployeesRepo _employeesRepo = EmployeesRepo();

  // Observable ApiResponse for employee list
  var employeesList = ApiResponse<List<EmployeeModel>>().obs;

  // Observable ApiResponse for a single employee
  var employeeDetail = ApiResponse<EmployeeModel>().obs;

  @override
  void onInit() {
    // employeesList.value = ApiResponse.loading();
    // employeeDetail.value = ApiResponse.loading();
    fetchAllEmployees();
    super.onInit();
  }

  // Fetch all employees
  Future<void> fetchAllEmployees() async {
    employeesList.value = ApiResponse.loading(); // Set loading state
    try {
      List<EmployeeModel> employees = await _employeesRepo.getAllEmployeesApi();
      employeesList.value = ApiResponse.completed(employees); // Set completed state with data
    } catch (error) {
      employeesList.value = ApiResponse.error(error.toString()); // Set error state
    }
  }

  // Search employee by ID
  Future<void> fetchEmployeeById(String id) async {
    employeeDetail.value = ApiResponse.loading(); // Set loading state
    try {
      EmployeeModel employee = await _employeesRepo.searchEmployeeByIdApi(id);
      employeeDetail.value = ApiResponse.completed(employee); // Set completed state with data
    } catch (error) {
      employeeDetail.value = ApiResponse.error(error.toString()); // Set error state
    }
  }

  // Create a new employee
  Future createEmployee(BuildContext context, EmployeeModel employee) async {
    try {
      await _employeesRepo.createEmployeeApi(employee);
      Utils.flushBarErrorMessages("Employee created successfully", context);
      fetchAllEmployees(); // Refresh the list after successful creation
    } catch (error) {
      Utils.flushBarErrorMessages(error.toString(), context);
    }
  }

  // Update an employee by ID
  Future<void> updateEmployee(BuildContext context, String id, EmployeeModel employee) async {
    try {
      await _employeesRepo.updateEmployeeByIdApi(id, employee);
      Utils.flushBarErrorMessages("Employee updated successfully", context);
      fetchAllEmployees(); // Refresh the list after successful update
    } catch (error) {
      Utils.flushBarErrorMessages(error.toString(), context);
    }
  }

  // Delete an employee by ID
  Future<void> deleteEmployee(BuildContext context, String id) async {
    try {
      await _employeesRepo.deleteEmployeeByIdApi(id);
      Utils.flushBarErrorMessages("Employee deleted successfully", context);
      fetchAllEmployees(); // Refresh the list after successful deletion
    } catch (error) {
      Utils.flushBarErrorMessages(error.toString(), context);
    }
  }
}
