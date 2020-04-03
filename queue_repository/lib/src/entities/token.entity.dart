import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String id;
  final String userid;
  final String name;
  final String employeeid;
  final int otp;
  final int noofrescheduled;
  final double timetomyturn;
  final DateTime createdat;
  final double actualduration;
  final double estimatedduration;
  final List<String> services;
  final DateTime servicestarted;
  final DateTime servicecompleted;
  


  TokenEntity(this.id, this.userid, this.name,this.employeeid,this.otp,this.noofrescheduled,this.timetomyturn,
  this.createdat,this.actualduration, this.estimatedduration, this.services, this.servicestarted, this.servicecompleted);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "userid": userid,
      "name": name,
      "employeeid": employeeid,
      "otp" : otp,
      "noofrescheduled": noofrescheduled,
      "timetomyturn" : timetomyturn,
      "createdat" : createdat,
      "actualduration" : actualduration,
      "estimatedduration" : estimatedduration,
      "services" :  services,
      "servicestarted" : servicestarted,
      "servicecompleted" : servicecompleted,
    };
  }

  @override
  List<Object> get props => [id, userid, name,employeeid, otp, noofrescheduled, timetomyturn, createdat, actualduration,estimatedduration, services,servicestarted,servicecompleted];

  @override
  String toString() {
    return 'TokenEntity { id: $id, userid: $userid, name: $name, employeeid:$employeeid, otp:$otp, noofrescheduled: $noofrescheduled, timetomyturn :$timetomyturn, createdat: $createdat,actualduration : $actualduration, estimatedduration: $estimatedduration, services: $services, servicestarted : $servicestarted,servicecompleted : $servicecompleted  }';
  }



 

  static TokenEntity fromJson(Map<String, Object> json) {
    return TokenEntity(
      json["id"] as String,
      json["userid"] as String,
      json["name"] as String,
      json["employeeid"] as String,
      json["otp"] as int,
      json["noofrescheduled"] as int,
      json["timetomyturn"] as double,
      json["createdat"] as DateTime,
      json["actualduration"] as double,
      json["estimatedduration"] as double,
      json["services"] as List<String>,
      json["servicestarted"] as DateTime,
      json["servicecompleted"] as DateTime,
    );
  }

 

  static TokenEntity fromSnapshot(DocumentSnapshot snap) {
    return TokenEntity(
      snap.documentID,
      snap.data['userid'],
      snap.data['name'],
      snap.data['employeeid'],
      snap.data['otp'],
      snap.data['noofrescheduled'],
      snap.data['timetomyturn'],
      snap.data['createdat'],
      snap.data['actualduration'],
      snap.data['estimatedduration'],
      snap.data['services'],
      snap.data['servicestarted'],
      snap.data['servicecompleted'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "userid": userid,
      "name": name,
      "employeeid": employeeid,
      "otp": otp,
      "noofrescheduled": noofrescheduled,
      "timetomyturn": timetomyturn,
      "createdat": createdat,
      "actualduration": actualduration,
      "estimatedduration": estimatedduration,
      "services": services,
      "servicestarted": servicestarted,
      "servicecompleted": servicecompleted,
    };
  }
}