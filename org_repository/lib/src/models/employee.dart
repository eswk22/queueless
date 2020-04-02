import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Employee {
  final String code;
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String orgid;
  final bool isactive;
  final List<String> services;

  Employee({String firstname,String lastname, String email, String code, String id, 
            String orgid, bool isactive,List<String> services}) 
      : this.firstname = firstname,
        this.lastname = lastname,
        this.email = email,
        this.code = code,
        this.id = id,
        this.orgid = orgid,
        this.isactive = isactive ?? true,
        this.services = services;

  Employee copyWith({String firstname,String lastname, String email, String code, String id, 
            String orgid, bool isactive,List<String> services}) {
    return Employee(
        firstname : firstname ?? this.firstname,
        lastname : lastname ?? this.lastname,
        email : email ?? this.email,
        code : code ?? this.code,
        id : id ?? this.id,
        orgid : orgid ?? this.orgid,
        isactive : isactive ?? this.isactive,
        services : services ?? this.services,
    );
  }

  @override
  int get hashCode =>
      firstname.hashCode ^ lastname.hashCode ^ email.hashCode ^ code.hashCode ^ id.hashCode ^ orgid.hashCode ^ isactive.hashCode ^ services.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          email == other.email &&
          code == other.code &&
          orgid == other.orgid &&
          isactive == other.isactive &&
          services == other.services &&
          id == other.id;

  @override
  String toString() {
    return 'Employee { email: $email, firstname: $firstname, orgid: $orgid, id: $id }';
  }

  EmployeeEntity toEntity() {
    return EmployeeEntity(code, id, email, firstname,lastname,orgid,isactive, services);
  }

  static Employee fromEntity(EmployeeEntity entity) {
    return Employee(
      firstname: entity.firstname,
      lastname: entity.lastname,
      email: entity.email,
      code: entity.code,
      id: entity.id,
      orgid: entity.orgid,
      isactive: entity.isactive,
      services: entity.services
    );
  }
}