import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class AppQueue {
  final String id;
  final String org;
  final String branchname;
  final String branchid;
  final String category;
  final String zipcode;
  final double latitude;
  final double longitude;
  final double waittime;
  final int noofusers;


  AppQueue({String id, String org, String branchname, String branchid,String category, String zipcode, double latitude,
               double longitude, double waittime, int noofusers,})
      : this.org = org, this.branchname = branchname, this.branchid = branchid, this.category = category,
        this.zipcode = zipcode, this.latitude = latitude, this.longitude = longitude, this.waittime = waittime,
        this.noofusers = noofusers, this.id = id;


  AppQueue copyWith({String id, String org, String branchname, String branchid,String category, String zipcode, double latitude,
               double longitude, double waittime, int noofusers,}) {
    return AppQueue(
      id: id ?? this.id,
      org : org ?? this.org,
      branchname: branchname ?? this.branchname,
      branchid: branchid ?? this.branchid,
      category: category ?? this.category,
      zipcode: zipcode ?? this.zipcode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      waittime: waittime ?? this.waittime,
      noofusers: noofusers ?? this.noofusers,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ org.hashCode ^ branchname.hashCode ^ branchid.hashCode ^ category.hashCode ^ zipcode.hashCode 
      ^ latitude.hashCode ^ longitude.hashCode ^ waittime.hashCode ^ noofusers.hashCode;



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppQueue &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          org == other.org &&
          branchname == other.branchname &&
          branchid == other.branchid &&
          category == other.category &&
          zipcode == other.zipcode &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          waittime == other.waittime &&
          noofusers == other.noofusers;

  @override
  String toString() {
    return 'AppQueue { id: $id, org: $org, branchname: $branchname, branchid:$branchid, category:$category, zipcode: $zipcode, latitude :$latitude, longitude: $longitude,waittime : $waittime, noofusers: $noofusers }';
  }

  AppQueueEntity toEntity() {
    return  AppQueueEntity(id,org, branchname, branchid, category, zipcode, latitude, longitude, waittime, noofusers);
  }

  static AppQueue fromEntity(AppQueueEntity entity) {
    return AppQueue(
      id : entity.id,
      org: entity.org,
      branchname: entity.branchname,
      branchid: entity.branchid,
      category: entity.category,
      zipcode: entity.zipcode,
      latitude: entity.latitude,
      longitude: entity.longitude,
      waittime: entity.waittime,
      noofusers: entity.noofusers,
    );
  }
}