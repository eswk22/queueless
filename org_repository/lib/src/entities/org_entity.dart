import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class OrgEntity extends Equatable {
  final String id;
  final String name;
  final bool isactive;



  OrgEntity(this.name, this.id, this.isactive);

  Map<String, Object> toJson() {
    return {
      "name": name,
      "isactive": isactive,
      "id": id,
    };
  }

  @override
  List<Object> get props => [name, id, isactive];

  @override
  String toString() {
    return 'OrgEntity { name: $name, id: $id, active: $isactive }';
  }

  static OrgEntity fromJson(Map<String, Object> json) {
    return OrgEntity(
      json["name"] as String,
      json["id"] as String,
      json["isactive"] as bool,
    );
  }

  static OrgEntity fromSnapshot(DocumentSnapshot snap) {
    return OrgEntity(
      snap.data['name'],
      snap.documentID,
      snap.data['isactive'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "isactive": isactive,
    };
  }
}