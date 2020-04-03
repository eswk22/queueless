import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppQueueEntity extends Equatable {
  final String id;
  final String org;
  final String branchname;
  final String branchid;
  final String category;
  final String zipcode;
  final GeoPoint location;
  final double latitude;
  final double longitude;
  final double waittime;
  final int noofusers;



  AppQueueEntity(this.id,this.org, this.branchname,this.branchid,this.category,this.zipcode,this.latitude,
  this.longitude,this.waittime, this.noofusers) : this.location = GeoPoint(latitude,longitude);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "org": org,
      "branchname": branchname,
      "branchid": branchid,
      "category" : category,
      "zipcode": zipcode,
      "latitude" : latitude,
      "longitude" : longitude,
      "waittime" : waittime,
      "noofusers" : noofusers,
      "location" :  location
    };
  }

  @override
  List<Object> get props => [id, org, branchname,branchid, category, zipcode, latitude, longitude, waittime,noofusers, location];

  @override
  String toString() {
    return 'AppQueueEntity { id: $id, org: $org, branchname: $branchname, branchid:$branchid, category:$category, zipcode: $zipcode, latitude :$latitude, longitude: $longitude,waittime : $waittime, noofusers: $noofusers, location: $location }';
  }


  static AppQueueEntity fromJson(Map<String, Object> json) {
    return AppQueueEntity(
      json["id"] as String,
      json["org"] as String,
      json["branchname"] as String,
      json["branchid"] as String,
      json["category"] as String,
      json["zipcode"] as String,
      json["latitude"] as double,
      json["longitude"] as double,
      json["waittime"] as double,
      json["noofusers"] as int,
    );
  }



  static AppQueueEntity fromSnapshot(DocumentSnapshot snap) {
    return AppQueueEntity(
      snap.documentID,
      snap.data['org'],
      snap.data['branchname'],
      snap.data['branchid'],
      snap.data['category'],
      snap.data['zipcode'],
      snap.data['latitude'],
      snap.data['longitude'],
      snap.data['waittime'],
      snap.data['noofusers'],
    );
  }


  Map<String, Object> toDocument() {
    return {
      "org": org,
      "branchname": branchname,
      "branchid": branchid,
      "category": category,
      "zipcode": zipcode,
      "location": location,
      "waittime": waittime,
      "noofusers": noofusers,
    };
  }
}