import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Token {
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


  Token({String id, String userid, String name, String employeeid,int otp, int noofrescheduled, double timetomyturn,
               DateTime createdat, double actualduration, double estimatedduration, List<String> services,
               DateTime servicestarted, DateTime servicecompleted})
      : this.userid = userid, this.name = name, this.employeeid = employeeid, this.otp = otp,
        this.noofrescheduled = noofrescheduled, this.timetomyturn = timetomyturn, this.createdat = createdat, 
        this.actualduration = actualduration, this.estimatedduration = estimatedduration,
        this.services = services, this.servicestarted = servicestarted, this.servicecompleted = servicecompleted,this.id = id;


  Token copyWith({String id, String userid, String name, String employeeid,int otp, int noofrescheduled, double timetomyturn,
               DateTime createdat, double actualduration, double estimatedduration, List<String> services,
               DateTime servicestarted, DateTime servicecompleted}) {
    return Token(
      id: id ?? this.id,
      userid : userid ?? this.userid,
      name: name ?? this.name,
      employeeid: employeeid ?? this.employeeid,
      otp: otp ?? this.otp,
      noofrescheduled: noofrescheduled ?? this.noofrescheduled,
      timetomyturn: timetomyturn ?? this.timetomyturn,
      createdat: createdat ?? this.createdat,
      actualduration: actualduration ?? this.actualduration,
      estimatedduration: estimatedduration ?? this.estimatedduration,
      services: services ?? this.services,
      servicestarted: servicestarted ?? this.servicestarted,
      servicecompleted: servicecompleted ?? this.servicecompleted,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ userid.hashCode ^ name.hashCode ^ employeeid.hashCode ^ otp.hashCode ^ noofrescheduled.hashCode 
      ^ timetomyturn.hashCode ^ createdat.hashCode ^ actualduration.hashCode ^ estimatedduration.hashCode ^ services.hashCode ^
      servicestarted.hashCode ^ servicecompleted.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          userid == other.userid &&
          name == other.name &&
          employeeid == other.employeeid &&
          otp == other.otp &&
          noofrescheduled == other.noofrescheduled &&
          timetomyturn == other.timetomyturn &&
          createdat == other.createdat &&
          actualduration == other.actualduration &&
          estimatedduration == other.estimatedduration &&
          services == other.services &&
          servicestarted == other.servicestarted &&
          servicecompleted == other.servicecompleted &&
          id == other.id;

  @override
  String toString() {
    return 'Token { id: $id, userid: $userid, name: $name, employeeid:$employeeid, otp:$otp, noofrescheduled: $noofrescheduled, timetomyturn :$timetomyturn, createdat: $createdat,actualduration : $actualduration, estimatedduration: $estimatedduration, services: $services, servicestarted : $servicestarted,servicecompleted : $servicecompleted  }';
  }

  TokenEntity toEntity() {
    return  TokenEntity(id, userid, name,employeeid, otp, noofrescheduled, timetomyturn, createdat, actualduration,estimatedduration, services,servicestarted,servicecompleted,);
  }

  static Token fromEntity(TokenEntity entity) {
    return Token(
      id : entity.id,
      userid: entity.userid,
      name: entity.name,
      employeeid: entity.employeeid,
      otp: entity.otp,
      noofrescheduled: entity.noofrescheduled,
      timetomyturn: entity.timetomyturn,
      createdat: entity.createdat,
      actualduration: entity.actualduration,
      estimatedduration: entity.estimatedduration,
      services: entity.services,
      servicestarted: entity.servicestarted,
      servicecompleted: entity.servicecompleted,
    );
  }
}