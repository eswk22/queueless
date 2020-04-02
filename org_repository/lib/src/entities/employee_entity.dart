import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final String code;
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String orgid;
  final bool isactive;
  final List<String> services;

  EmployeeEntity(this.code, this.id, this.email, this.firstname, this.lastname, this.orgid, this.isactive, this.services);

  Map<String, Object> toJson() {
    return {
      "code": code,
      "id": id,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "orgid" : orgid,
      "isactive" : isactive,
      "services" : services
    };
  }

  @override
  List<Object> get props => [code, id, email, firstname, lastname, orgid, isactive, services];

  @override
  String toString() {
    return 'EmployeeEntity { email: $email, firstname: $firstname, orgid: $orgid, id: $id }';
  }

  static EmployeeEntity fromJson(Map<String, Object> json) {
    return EmployeeEntity(
      json["code"] as String,
      json["id"] as String,
      json["email"] as String,
      json["firstname"] as String,
      json["lastname"] as String,
      json["orgid"] as String,
      json["isactive"] as bool,
      json["services"] as List<String>,
    );
  }

  static EmployeeEntity fromSnapshot(DocumentSnapshot snap) {
    return EmployeeEntity(
      snap.data['code'],
      snap.documentID,
      snap.data['email'],
      snap.data['firstname'],
      snap.data['lastname'],
      snap.data['orgid'],
      snap.data['isactive'],
      snap.data['services'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "code": code,
      "email": email,
      "firstname": firstname,
      "lastname" : lastname,
      "orgid" : orgid,
      "isactive" : isactive,
      "services" : services
    };
  }
}