import 'dart:async';

import 'models/models.dart';



abstract class EmployeeRepository {
  Future<void> addNewEmployee(Employee todo);

  Future<void> deleteEmployee(Employee todo);

  Stream<List<Employee>> getEmployees();

  Future<void> updateEmployee(Employee todo);
}