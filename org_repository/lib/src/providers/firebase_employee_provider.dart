import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../employee_repository.dart';

class FirebaseEmployeeRepository implements EmployeeRepository {
  final orgCollection = Firestore.instance.collection('Employees');

  @override
  Future<void> addNewEmployee(Employee org) {
    return orgCollection.add(org.toEntity().toDocument());
  }

  @override
  Future<void> deleteEmployee(Employee org) async {
    return orgCollection.document(org.id).delete();
  }

  @override
  Stream<List<Employee>> getEmployees() {
    return orgCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Employee.fromEntity(EmployeeEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateEmployee(Employee update) {
    return orgCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}