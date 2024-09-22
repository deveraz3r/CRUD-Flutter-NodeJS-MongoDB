import 'dart:convert';

import 'package:crud_mongodb_frontend/model/employee_model.dart';
import 'package:crud_mongodb_frontend/utils/app_urls.dart';

class EmployeesRepo {
  final BaseApiServices _apiService = NetworkApiService();

  //get
  Future<List<EmployeeModel>> getAllEmployeesApi() async {
    try{
      Map<String, dynamic> response = await _apiService.getGetApiResponse(AppEndPoints.getAllEmployees);

      // Convert the "data" list to a List<EmployeeModel>
      List<EmployeeModel> employees = (response['data'] as List)
          .map((item) => EmployeeModel.fromJson(item))
          .toList();

      return employees;
    }
    catch (e) {
      print("Error is repo: ${e.toString()}");
      rethrow;
    }
  }

  //get
  Future<EmployeeModel> searchEmployeeByIdApi(String id) async {
    try{
      dynamic response = await _apiService.getGetApiResponse("${AppEndPoints.getEmployee}?id=$id");
      return EmployeeModel.fromJson(response);
    }
    catch (e) {
      rethrow;
    }
  }

  //post
  Future<void> createEmployeeApi(EmployeeModel employee) async{
    try{
      await _apiService.getPostApiResponse(AppEndPoints.createEmployee, employee);
    }
    catch (e) {
      rethrow;
    }
  }

  //put
  Future<EmployeeModel> updateEmployeeByIdApi(String id, EmployeeModel employee) async {
    try{
      dynamic response = await _apiService.getPostApiResponse("${AppEndPoints.getEmployee}?id=$id", employee);
      return EmployeeModel.fromJson(response);
    }
    catch (e) {
      rethrow;
    }
  }

  //delete
  Future<void> deleteEmployeeByIdApi(String id) async {
    try{
      await _apiService.getDeleteApiResponse("${AppEndPoints.deleteEmployee}?id=$id");
    }
    catch (e) {
      rethrow;
    }
  }

}